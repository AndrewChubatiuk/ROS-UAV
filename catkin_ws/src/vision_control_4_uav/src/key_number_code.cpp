#include <ros/ros.h>
#include <geometry_msgs/Twist.h>
#include <curses.h>
#include "std_msgs/String.h"
#include "std_msgs/Empty.h"
#include "std_srvs/Empty.h"
#include <iostream>
//#include "snt_ardrone_driver/filter_state.h"
#include "vision_control_4_uav/codeCommand.h"


ros::Publisher vel_pub;
ros::Publisher takeoff_pub;
ros::Publisher land_pub;
ros::Publisher toggleState_pub;
ros::Publisher toggleCam_pub;
ros::Publisher codeCommand_pub;

std_msgs::Empty emp_msg;
vision_control_4_uav::codeCommand msg_code_command;


class RobotDriver
{
private:
  //! The node handle we'll be using
  ros::NodeHandle nh_;
  //! We will be publishing to the "/base_controller/command" topic to issue commands
  ros::Publisher cmd_vel_pub_;

public:
  //! ROS node initialization
  RobotDriver(ros::NodeHandle &nh)
  {
    nh_ = nh;
    //set up the publisher for the cmd_vel topic
    cmd_vel_pub_ = nh_.advertise<geometry_msgs::Twist>("/base_controller/command", 1);
  }

  //! Loop forever while sending drive commands based on keyboard input

  bool driveKeyboard()
  {
    std::cout << "Type a command and then press enter.  "
      "Use '+' to move forward, 'l' to turn left, "
      "'r' to turn right, '.' to exit.\n";

    //we will be sending commands of type "twist"
    geometry_msgs::Twist cmdT;

    char cmd[50];
    char c;
 //   system ("/bin/stty raw");
    while(nh_.ok()){
  //  	std::cin.get(cmd);
 //   	c = std::getchar();

 //   	std::putchar(cmd);

     std::cin.getline(cmd, 50);
      if(cmd[0]!=' ' && cmd[0]!='t' && cmd[0]!='l' && cmd[0]!='r' && cmd[0]!='.' && cmd[0]!='r' && cmd[0]!='f' && cmd[0]!='d' && cmd[0]!='g' && cmd[0]!='c' && cmd[0]!='q' && cmd[0]!='w' && cmd[0]!='s' && cmd[0]!='z' &&!std::isdigit(cmd[0]) && (cmd[0]!='-'))
 //       if(c!=' ' && c!='l' && c!='t' && c!='.' && c!='c')
      {
        std::cout << "unknown command:" << cmd << "\n";
        continue;
      }

      if(cmd[0]=='t'){
    	ROS_INFO("Takeoff key pressed.\n");
		double time_start=(double)ros::Time::now().toSec();
		ros::Rate loop_rate(50);
		while ((double)ros::Time::now().toSec()< time_start+4.0)  //Send command for five seconds
			{
			takeoff_pub.publish(emp_msg);  //launches the drone
			ros::spinOnce();
			loop_rate.sleep();
		}//time loop
      }else if(cmd[0]=='l'){
    	  ROS_INFO("landing key pressed\n");
    	  land_pub.publish(std_msgs::Empty());
      }else if(cmd[0]==' '){
          	  ROS_INFO("Emergency/Reset key pressed\n");
          	  toggleState_pub.publish(std_msgs::Empty());
      }else if(cmd[0]=='c'){
          	  ROS_INFO("changing camera\n");
          	  toggleCam_pub.publish(std_msgs::Empty());
      }else if (cmd[0]=='q'){
    	  ROS_INFO("yaw turning key pressed\n");
			cmdT.angular.z = 0.3;
			cmdT.linear.z = 0.0;
			cmdT.linear.x = 0.0;
			cmdT.linear.y = 0.0;
			vel_pub.publish(cmdT);
      }else if (cmd[0]=='w'){
    	    ROS_INFO("Going up key pressed\n");
			cmdT.angular.z = 0.0;
			cmdT.linear.z = 0.8;  //in the lab =0.3
			cmdT.linear.x = 0.0;
			cmdT.linear.y = 0.0;
			vel_pub.publish(cmdT);
      }else if (cmd[0]=='s'){
  	    ROS_INFO("Going down key pressed\n");
			cmdT.angular.z = 0.0;
			cmdT.linear.z = -0.3;
			cmdT.linear.x = 0.0;
			cmdT.linear.y = 0.0;
			vel_pub.publish(cmdT);
      }else if (cmd[0]=='z'){
    	  ROS_INFO("Zero movement key pressed\n");
			cmdT.angular.z = 0.0;
			cmdT.linear.z = 0.0;
			cmdT.linear.x = 0.0;
			cmdT.linear.y = 0.0;
			vel_pub.publish(cmdT);
      }else if (cmd[0]=='r'){
    	  ROS_INFO("Forward movement key pressed\n");
			cmdT.angular.z = 0.0;
			cmdT.linear.z = 0.0;
			cmdT.linear.x = 0.15;
			cmdT.linear.y = 0.0;
			vel_pub.publish(cmdT);
      }else if (cmd[0]=='f'){
    	  ROS_INFO("Backward movement key pressed\n");
			cmdT.angular.z = 0.0;
			cmdT.linear.z = 0.0;
			cmdT.linear.x = -0.15;
			cmdT.linear.y = 0.0;
			vel_pub.publish(cmdT);
      }else if (cmd[0]=='d'){
    	  ROS_INFO("Left movement key pressed\n");
			cmdT.angular.z = 0.0;
			cmdT.linear.z = 0.0;
			cmdT.linear.x = 0.0;
			cmdT.linear.y = 0.15;
			vel_pub.publish(cmdT);
      }else if (cmd[0]=='g'){
    	  ROS_INFO("Right movement key pressed\n");
			cmdT.angular.z = 0.0;
			cmdT.linear.z = 0.0;
			cmdT.linear.x = 0.0;
			cmdT.linear.y = -0.15;
			vel_pub.publish(cmdT);
      }else if(cmd[0]=='.'){//quit
          	  ROS_INFO(". pressed");
          //	  system ("/bin/stty cooked");
              break;
      }else if (std::isdigit(cmd[0]) || ((cmd[0]='-') && std::isdigit(cmd[1]))){
    	  ROS_INFO("%d number pressed",atoi(cmd));
    	  msg_code_command.code = atoi(cmd);
    	  codeCommand_pub.publish(msg_code_command);
      }
    }
    return true;
  }

};

int main(int argc, char** argv)
{
  //init the ROS node
	ros::init(argc, argv, "emergency_ardrone_control");


	std::string land_channel;
	std::string takeoff_channel;
	std::string  toggleState_channel;
	std::string  toggleCam_channel;
	std::string control_channel;

	ros::NodeHandle nh_;


	control_channel = nh_.resolveName("/cmd_vel");
	takeoff_channel = nh_.resolveName("/ardrone/takeoff");
	land_channel = nh_.resolveName("/ardrone/land");
	toggleState_channel = nh_.resolveName("/ardrone/reset");
	toggleCam_channel = nh_.resolveName("/ardrone/togglecam");

	vel_pub	   = nh_.advertise<geometry_msgs::Twist>(control_channel,1);
	takeoff_pub	   = nh_.advertise<std_msgs::Empty>(takeoff_channel,1);
	land_pub	   = nh_.advertise<std_msgs::Empty>(land_channel,1);
	toggleState_pub	   = nh_.advertise<std_msgs::Empty>(toggleState_channel,1);
	toggleCam_pub	   = nh_.advertise<std_msgs::Empty>(toggleCam_channel,1);
	codeCommand_pub		= nh_.advertise<vision_control_4_uav::codeCommand>("code_command",1000);

	ros::NodeHandle nh;

	RobotDriver driver(nh);
	driver.driveKeyboard();
}
