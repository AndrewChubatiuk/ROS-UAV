cmake_minimum_required(VERSION 2.8)
project(aruco)

set(CMAKE_CXX_FLAGS "-std=gnu++0x ${CMAKE_CXX_FLAGS}")

list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake")

set( MESSAGE_DEPENDENCIES
  std_msgs
  geometry_msgs
)

find_package(catkin REQUIRED COMPONENTS
  roscpp
  rospy
  rosbag
  std_srvs
  tf
  message_generation
  cv_bridge
  image_transport
  ${MESSAGE_DEPENDENCIES}
)


add_message_files(DIRECTORY msg
  FILES
  marker_info.msg
  DetectedMarker.msg
  DetectedMarkerArray.msg
)

generate_messages(
  DEPENDENCIES 
  ${MESSAGE_DEPENDENCIES}
)

catkin_package(
  INCLUDE_DIRS include
  CATKIN_DEPENDS message_runtime roscpp rospy std_msgs std_srvs rosbag cv_bridge image_transport
)

include_directories(
    include
    ${catkin_INCLUDE_DIRS}
    ${Boost_INCLUDE_DIRS}
)

set(ARUCO_SOURCE_FILES
	src/aruco/arucofidmarkers.cpp
	src/aruco/board.cpp
	src/aruco/boarddetector.cpp
	src/aruco/cameraparameters.cpp
	src/aruco/cvdrawingutils.cpp
	src/aruco/marker.cpp
	src/aruco/markerdetector.cpp
	src/aruco/aruco_gl.cpp
)

set(ARUCO_HEADER_FILES
	src/aruco/aruco.h
	src/aruco/arucofidmarkers.h
	src/aruco/board.h
	src/aruco/boarddetector.h
	src/aruco/cameraparameters.h
	src/aruco/cvdrawingutils.h
	src/aruco/marker.h
	src/aruco/markerdetector.h
	src/aruco/exports.h
	src/aruco/aruco_gl.h
)

#Create an Aruco computer vision algorithm instance
add_executable(aruco_run src/aruco_run.cpp ${ARUCO_SOURCE_FILES} ${OPENGL_LIBS})
add_executable(aruco_listener src/aruco_listen.cpp ${ARUCO_SOURCE_FILES} ${OPENGL_LIBS})

target_link_libraries(aruco_run
  ${catkin_LIBRARIES}
  ${Boost_LIBRARIES}
  ${OpenCV_LIBRARIES}
  glut
  GLU
  GL
)

target_link_libraries(aruco_listener
  ${catkin_LIBRARIES}
  ${Boost_LIBRARIES}
  ${OpenCV_LIBRARIES}
  glut
  GLU
  GL
)

add_dependencies(aruco_run ${catkin_EXPORTED_TARGETS})
add_dependencies(aruco_run ${PROJECT_NAME}_generate_messages_cpp)

install(TARGETS aruco_run
  RUNTIME DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION}
)

add_dependencies(aruco_listener ${catkin_EXPORTED_TARGETS})
add_dependencies(aruco_listener ${PROJECT_NAME}_generate_messages_cpp)

install(TARGETS aruco_listener
  RUNTIME DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION}
)

