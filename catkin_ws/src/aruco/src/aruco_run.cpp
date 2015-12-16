#include "aruco/aruco.h"
#include <aruco/DetectedMarker.h>
#include <aruco/DetectedMarkerArray.h>
#include "aruco/cvdrawingutils.h"
#include "aruco/marker_info.h"
#include <cstdlib>
#include <cv_bridge/cv_bridge.h>						//Use cv_bridge to convert between ROS and OpenCV Image formats
#include <geometry_msgs/PoseStamped.h>
#include <geometry_msgs/Point.h>
#include <geometry_msgs/Quaternion.h>
#include <image_transport/image_transport.h>			//Use image_transport for publishing and subscribing to images in ROS
#include <opencv2/imgproc/imgproc.hpp>					//Include headers for OpenCV Image processing
#include <opencv2/highgui/highgui.hpp>					//Include headers for OpenCV GUI handling
#include "ros/ros.h"
#include "sensor_msgs/Image.h"
#include <sensor_msgs/image_encodings.h>				//Include some useful constants for image encoding.
#include "std_msgs/Float32.h"
#include <string.h>
#include <tf/transform_datatypes.h>
#include <tf/transform_listener.h>
#include <tf/transform_broadcaster.h>
#include <iostream>

namespace encoding = sensor_msgs::image_encodings;

class ImageListener {

	aruco::CameraParameters camera_params;
	cv_bridge::CvImagePtr cv_image_pointer;
	vector<aruco::Marker> aruco_marker_vector;
	aruco::MarkerDetector marker_detector;
	float marker_size;
	ros::Publisher marker_info_publisher, detected_markers_publisher;
	ros::NodeHandle node;
	IplImage image;
	double threshold_2 = 3.0;
	double threshold_1 = 12.0;
	double area;
    cv::Point2f center;
    tf::TransformBroadcaster* tf_broadcaster;

public:
	void imageCallback(const sensor_msgs::ImageConstPtr& msg);
	ImageListener(float, char[]);
	ros::NodeHandle getNode();

protected:
	aruco::marker_info setMarkerMessageInfo(aruco::Marker, aruco::marker_info);
	geometry_msgs::PoseStamped setPoseStamp(aruco::Marker marker);
};

ros::NodeHandle ImageListener::getNode() {
	return this->node;
}

ImageListener::ImageListener(float marker_size, char camera_file[]) {
	this->marker_size = marker_size;
	image_transport::ImageTransport img_transport(node);
	marker_info_publisher = node.advertise<aruco::marker_info>("marker_info", 1000);
	detected_markers_publisher = node.advertise<aruco::DetectedMarkerArray>("detected_markers", 1000);
	camera_params.readFromXMLFile(camera_file);
	tf_broadcaster = new tf::TransformBroadcaster();
}

aruco::marker_info ImageListener::setMarkerMessageInfo(aruco::Marker marker, aruco::marker_info message_info) {
	message_info.id.push_back(marker.getId());
	message_info.centerX.push_back(marker.getCenter().x);
	message_info.centerY.push_back(marker.getCenter().y);
	message_info.area.push_back(marker.getArea());
	message_info.perimeter.push_back(marker.getPerimeter());
	message_info.rotX.push_back(marker.getXrot());
	message_info.rotY.push_back(marker.getYrot());
	message_info.rotZ.push_back(marker.getZrot());
	message_info.distance.push_back(marker.getTZ());
	message_info.trsX.push_back(marker.getTX());
	message_info.trsY.push_back(marker.getTY());
	message_info.numberOfMarkers = message_info.numberOfMarkers++;
	return message_info;
}

geometry_msgs::PoseStamped ImageListener::setPoseStamp(aruco::Marker marker) {
	geometry_msgs::PoseStamped pose_stamped;
	geometry_msgs::Point position;
	position.x = -marker.getTX();
	position.y = marker.getTY();
	position.z = marker.getTZ();
	pose_stamped.header.stamp = ros::Time::now();
	pose_stamped.header.frame_id = std::to_string(marker.getId());
	pose_stamped.pose.position = position;
	pose_stamped.pose.orientation = tf::createQuaternionMsgFromRollPitchYaw(
		marker.getXrot(),
		marker.getYrot(),
		marker.getZrot()
	);
	return pose_stamped;
}

void ImageListener::imageCallback(const sensor_msgs::ImageConstPtr& msg) {
	try	{
		cv_image_pointer = cv_bridge::toCvCopy(msg, encoding::BGR8);					//Always copy, returning a mutable CvImage. OpenCV expects color images to use BGR channel order.
	} catch (cv_bridge::Exception& e) {
		ROS_ERROR("no camera detected. exception: %s", e.what());		//if there is an error during conversion, display it
		return;
	}
	aruco::marker_info marker_info_msg;
	image = cv_image_pointer->image;
	cv::Mat image_data = cv::Mat(&image, true);
	camera_params.resize(image_data.size());
	marker_detector.setThresholdParams(threshold_1, threshold_2);
	marker_detector.setCornerRefinementMethodInt(3);
	marker_detector.detect(
		image_data,
		aruco_marker_vector, 
		camera_params,
		marker_size
	);
	aruco::DetectedMarkerArray marker_array_msg;
	cout << aruco_marker_vector.size() << endl;
	for (unsigned int index = 0; index < aruco_marker_vector.size(); index++) {
		marker_info_msg = setMarkerMessageInfo(aruco_marker_vector[index], marker_info_msg);
		marker_info_msg.numberOfMarkers = index+1;
		center = aruco_marker_vector[index].getCenter();
		area = aruco_marker_vector[index].getArea();
		if (camera_params.isValid()) {
			aruco::CvDrawingUtils::draw3dCube(
				image_data,
				aruco_marker_vector[index],
				camera_params
			);
			aruco::CvDrawingUtils::draw3dAxis(
				image_data,
				aruco_marker_vector[index],
				camera_params
			);
		} else {
			aruco_marker_vector[index].draw(image_data, cv::Scalar(0,0,255), 2);
		}
		geometry_msgs::PoseStamped pose_stamped = this->setPoseStamp(aruco_marker_vector[index]);
		aruco::DetectedMarker marker;
		marker.id = aruco_marker_vector[index].getId();
		marker.pose = pose_stamped;
		marker_array_msg.markers.push_back(marker);
		tf::Stamped<tf::Pose> tf_pose_stamped;
		tf::poseStampedMsgToTF(pose_stamped, tf_pose_stamped);
		tf::Transform t(tf_pose_stamped.getRotation(), tf_pose_stamped.getOrigin());
		std::string id_str = std::to_string(aruco_marker_vector[index].getId()) + "_estimated";
		std::string estimated_frame_id = id_str + "_estimated"; 
		tf_broadcaster->sendTransform(tf::StampedTransform(t, ros::Time::now(), id_str, estimated_frame_id));
	}
	marker_info_publisher.publish(marker_info_msg);
	detected_markers_publisher.publish(marker_array_msg);
	cv::imshow("view", image_data);				//Display the image using OpenCV
	cv::waitKey(1);								//Add some delay in miliseconds. The function only works if there is at least one HighGUI window created and the window is active. If there are several HighGUI windows, any of them can be active.
	cv_image_pointer->image = image_data;		//Convert the CvImage to a ROS image message and publish it on the "camera/image_processed" topic.
}


int main(int argc, char **argv) {
	char *camera_topic, *camera_file;
	float marker_size;
	ros::init(argc, argv, "aruco");
	if (argc >= 3) {
		marker_size = atof(argv[2]);
		camera_topic = argv[1];
		camera_file = argv[3];
	} else {
		ROS_INFO("aruco requires 3 arguments:\n - camera topic;\n - aruco marker size;\n - calibration file.");
		return 0;
	}
	ImageListener image_listener(marker_size, camera_file);
	ros::Subscriber image_subscriber = image_listener.getNode().subscribe(
		camera_topic,
		1,
		&ImageListener::imageCallback,
		&image_listener
	);
	cv::namedWindow("view", CV_WINDOW_AUTOSIZE);
	cv::destroyWindow("view");
	ros::spin();
	return 0;
}