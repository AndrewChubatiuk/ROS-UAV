#include "aruco/marker_info.h"
#include "ros/ros.h"
#include <image_transport/image_transport.h>	
#include "std_msgs/String.h"
#include <string>
#include "std_msgs/Float32.h"
#include <chrono>
#include "aruco/aruco.h"
#include "aruco/cvdrawingutils.h"
#include <cstdlib>
#include <thread>
#include <cv_bridge/cv_bridge.h>						//Use cv_bridge to convert between ROS and OpenCV Image formats
#include <geometry_msgs/PoseStamped.h>
#include <geometry_msgs/Point.h>
#include <geometry_msgs/Quaternion.h>			//Use image_transport for publishing and subscribing to images in ROS
#include <tf/transform_datatypes.h>
#include <tf/transform_listener.h>
#include <tf/transform_broadcaster.h>
#include <iostream>

struct position {
	float X;
	float Y;
};

class VrepController {
	float angle[3] = {0.0, 0.0, 0.0};
	ros::Publisher yaw_publisher, height_publisher, roll_publisher, pitch_publisher;
	ros::NodeHandle node;
	int countdown = 0;
	float height = 0.0;
	position current = {.X = 0.0, .Y = 0.0};
	int current_id = 0;

public:
	VrepController();
	void vrepPositionCallback(const aruco::marker_info& msg);
	void gyroscopeCallback(const std_msgs::String& msg);
	void vrepHeightCallback(const std_msgs::Float32& msg);
	ros::NodeHandle getNode();
	void controlThread();
};

void VrepController::controlThread() {
	while(1) {
		printf("X: %f, Y: %f\n", current.X, current.Y);
		std_msgs::Float32 directionX, directionY, yawDirection;
		if (current.X > 0) {
			directionX.data = current.X - height/10.0 * tan(abs(angle[0]));
		} else {
			directionX.data = current.X + height/10.0 * tan(abs(angle[0]));
		}
		if (current.Y > 0) {
			directionY.data = current.Y - height/10.0 * tan(abs(angle[1]));
		} else {
			directionY.data = current.Y + height/10.0 * tan(abs(angle[1]));
		}
		if (abs(current.X) < 0.3 && abs(current.Y) < 0.3) {
			yawDirection.data=0.0;
		} else {
			if(abs(current.X) >= 1.0) {
			   yawDirection.data = 0.1 * directionX.data / abs(directionX.data);
			   directionX.data = 0.0;
			} else if(abs(current.X) < 1.0 && abs(current.X) > 0.8) {
			   yawDirection.data = 0.5 * pow(directionX.data,3);
			   directionX.data = 0.0;
			} else if (abs(current.X) <= 0.8 && abs(current.X) > 0.5) {
			   yawDirection.data = 2 * pow(directionX.data,3);
			   directionX.data = 0.0;
		    } else if (abs(current.X) <= 0.5 && abs(current.X) > 0.1) {
			   yawDirection.data = 5 * pow(directionX.data,3);
			   directionX.data = 0.0;
		    } else if (abs(current.X) <= 0.1){
		       yawDirection.data = 0.0;
			} else {
			   directionX.data = 0.0;
			}
		}
		pitch_publisher.publish(directionY);
		roll_publisher.publish(directionX);
		yaw_publisher.publish(yawDirection);
		if (abs(current.X) < 0.0001) {
			current.X = 0.0;
		} else {
			current.X /= 1.001; 
		}
		if (abs(current.Y) < 0.0001) {
			current.Y = 0.0;
		} else {
			current.Y /= 1.001; 
		}
		if (countdown <= 0) {
			current.Y = 0.0;
			current.X = 0.0;
		} else {
			countdown--;
		}
		std::this_thread::sleep_for (std::chrono::milliseconds(10));
	}
}

VrepController::VrepController() {
	image_transport::ImageTransport img_transport(node);
	yaw_publisher = node.advertise<std_msgs::Float32>("/vrep_VC/yawControl", 1);
	roll_publisher = node.advertise<std_msgs::Float32>("/vrep_VC/rollControl", 1);
	pitch_publisher = node.advertise<std_msgs::Float32>("/vrep_VC/pitchControl", 1);
	height_publisher = node.advertise<std_msgs::Float32>("/vrep_VC/heightControl", 1); 
}

void VrepController::vrepHeightCallback(const std_msgs::Float32& msg) {
	this->height = msg.data;
	ROS_INFO("height: %f", this->height);
}

void VrepController::vrepPositionCallback(const aruco::marker_info& msg) {
	for (int i=0; i<msg.numberOfMarkers; i++){
		this->current.X = msg.trsX[i];
		this->current.Y = msg.trsY[i];
		ROS_INFO("Id: %d, Center.X: %f, Center.Y: %f, RotX: %f, RotY: %f, RotZ: %f, Distance: %f, Xtras: %f, Ytras: %f",
			msg.id[i],
			msg.centerX[i],
			msg.centerY[i],
			msg.rotX[i],
			msg.rotY[i],
			msg.rotZ[i],
			msg.distance[i],
			msg.trsX[i],
			msg.trsY[i]
		);
	}
	countdown = 2000;
}

void VrepController::gyroscopeCallback(const std_msgs::String& msg) {
	int floatCount=msg.data.size()/sizeof(float);
	std::vector<float> myReceivedFloats;
	for (int i=0;i<floatCount;i++) {
		myReceivedFloats.push_back(((float*)msg.data.c_str())[i]);
	}
	float ar[3];
	this->angle[0]=myReceivedFloats[0];
	this->angle[1]=myReceivedFloats[1];
	this->angle[2]=myReceivedFloats[2];
}

ros::NodeHandle VrepController::getNode() {
	return this->node;
}

int main(int argc, char **argv)
{
	ros::init(argc, argv, "listener");
	VrepController controller;
	ros::Subscriber gyroscope_subscriber = controller.getNode().subscribe(
		"/vrep/gyroscope",
		1,
		&VrepController::gyroscopeCallback,
		&controller
	);
	ros::Subscriber aruco_subscriber = controller.getNode().subscribe(
		"/marker_info", 
		1, 
		&VrepController::vrepPositionCallback,
		&controller
	);
	ros::Subscriber height_subscriber = controller.getNode().subscribe(
		"/vrep/height", 
		1, 
		&VrepController::vrepHeightCallback,
		&controller
	);
	std::thread control_executor(&VrepController::controlThread, &controller);
	ros::spin();
	return 0;
}