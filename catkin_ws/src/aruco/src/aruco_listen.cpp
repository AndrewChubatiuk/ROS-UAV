#include "ros/ros.h"
#include "std_msgs/String.h"
#include "aruco/marker_info.h"
#include <cstdlib>

float alpha, beta, heading, azimuth;

void chatterCallback(const aruco::marker_info& msg)
{
  ROS_INFO("I heard: [#%d]. ", msg.numberOfMarkers);
  for (int i=0; i<msg.numberOfMarkers; ++i){
	  alpha = atan(msg.trsX[i] / msg.distance[i]) * (180 / 3.1416);
	  beta = atan(msg.trsY[i] / msg.distance[i]) * (180 / 3.1416);
	  heading = msg.rotY[i] * (180 / 3.1416);
	  azimuth = msg.rotX[i] * (180 / 3.1416) + 90.0;
	  ROS_INFO(
      "alpha: %f, beta: %f, heading: %f, azimuth: %f", 
      alpha-heading, 
      beta-azimuth,
      heading,azimuth
    );
    ROS_INFO(
      "Id: %d, Center.X: %f, Center.Y: %f, RotX: %f, RotY: %f, RotZ: %f, Distance: %f, Xtras: %f, Ytras: %f", 
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
}

int main(int argc, char **argv)
{
  ros::init(argc, argv, "listener");
  ros::NodeHandle n;
  ros::Subscriber sub = n.subscribe("/marker_info", 1000, chatterCallback);
  ros::spin();
  return 0;
}
