# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "aruco: 3 messages, 0 services")

set(MSG_I_FLAGS "-Iaruco:/home/andrew/catkin_ws/src/aruco/msg;-Istd_msgs:/opt/ros/indigo/share/std_msgs/cmake/../msg;-Igeometry_msgs:/opt/ros/indigo/share/geometry_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(genlisp REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(aruco_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/andrew/catkin_ws/src/aruco/msg/marker_info.msg" NAME_WE)
add_custom_target(_aruco_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "aruco" "/home/andrew/catkin_ws/src/aruco/msg/marker_info.msg" ""
)

get_filename_component(_filename "/home/andrew/catkin_ws/src/aruco/msg/DetectedMarker.msg" NAME_WE)
add_custom_target(_aruco_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "aruco" "/home/andrew/catkin_ws/src/aruco/msg/DetectedMarker.msg" "geometry_msgs/Point:geometry_msgs/PoseStamped:geometry_msgs/Quaternion:std_msgs/Header:geometry_msgs/Pose"
)

get_filename_component(_filename "/home/andrew/catkin_ws/src/aruco/msg/DetectedMarkerArray.msg" NAME_WE)
add_custom_target(_aruco_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "aruco" "/home/andrew/catkin_ws/src/aruco/msg/DetectedMarkerArray.msg" "geometry_msgs/Point:std_msgs/Header:geometry_msgs/Quaternion:aruco/DetectedMarker:geometry_msgs/PoseStamped:geometry_msgs/Pose"
)

#
#  langs = gencpp;genlisp;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(aruco
  "/home/andrew/catkin_ws/src/aruco/msg/marker_info.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/aruco
)
_generate_msg_cpp(aruco
  "/home/andrew/catkin_ws/src/aruco/msg/DetectedMarker.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Pose.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/aruco
)
_generate_msg_cpp(aruco
  "/home/andrew/catkin_ws/src/aruco/msg/DetectedMarkerArray.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Quaternion.msg;/home/andrew/catkin_ws/src/aruco/msg/DetectedMarker.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Pose.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/aruco
)

### Generating Services

### Generating Module File
_generate_module_cpp(aruco
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/aruco
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(aruco_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(aruco_generate_messages aruco_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/andrew/catkin_ws/src/aruco/msg/marker_info.msg" NAME_WE)
add_dependencies(aruco_generate_messages_cpp _aruco_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/andrew/catkin_ws/src/aruco/msg/DetectedMarker.msg" NAME_WE)
add_dependencies(aruco_generate_messages_cpp _aruco_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/andrew/catkin_ws/src/aruco/msg/DetectedMarkerArray.msg" NAME_WE)
add_dependencies(aruco_generate_messages_cpp _aruco_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(aruco_gencpp)
add_dependencies(aruco_gencpp aruco_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS aruco_generate_messages_cpp)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(aruco
  "/home/andrew/catkin_ws/src/aruco/msg/marker_info.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/aruco
)
_generate_msg_lisp(aruco
  "/home/andrew/catkin_ws/src/aruco/msg/DetectedMarker.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Pose.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/aruco
)
_generate_msg_lisp(aruco
  "/home/andrew/catkin_ws/src/aruco/msg/DetectedMarkerArray.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Quaternion.msg;/home/andrew/catkin_ws/src/aruco/msg/DetectedMarker.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Pose.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/aruco
)

### Generating Services

### Generating Module File
_generate_module_lisp(aruco
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/aruco
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(aruco_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(aruco_generate_messages aruco_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/andrew/catkin_ws/src/aruco/msg/marker_info.msg" NAME_WE)
add_dependencies(aruco_generate_messages_lisp _aruco_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/andrew/catkin_ws/src/aruco/msg/DetectedMarker.msg" NAME_WE)
add_dependencies(aruco_generate_messages_lisp _aruco_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/andrew/catkin_ws/src/aruco/msg/DetectedMarkerArray.msg" NAME_WE)
add_dependencies(aruco_generate_messages_lisp _aruco_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(aruco_genlisp)
add_dependencies(aruco_genlisp aruco_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS aruco_generate_messages_lisp)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(aruco
  "/home/andrew/catkin_ws/src/aruco/msg/marker_info.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/aruco
)
_generate_msg_py(aruco
  "/home/andrew/catkin_ws/src/aruco/msg/DetectedMarker.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Pose.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/aruco
)
_generate_msg_py(aruco
  "/home/andrew/catkin_ws/src/aruco/msg/DetectedMarkerArray.msg"
  "${MSG_I_FLAGS}"
  "/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/indigo/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Quaternion.msg;/home/andrew/catkin_ws/src/aruco/msg/DetectedMarker.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/PoseStamped.msg;/opt/ros/indigo/share/geometry_msgs/cmake/../msg/Pose.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/aruco
)

### Generating Services

### Generating Module File
_generate_module_py(aruco
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/aruco
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(aruco_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(aruco_generate_messages aruco_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/andrew/catkin_ws/src/aruco/msg/marker_info.msg" NAME_WE)
add_dependencies(aruco_generate_messages_py _aruco_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/andrew/catkin_ws/src/aruco/msg/DetectedMarker.msg" NAME_WE)
add_dependencies(aruco_generate_messages_py _aruco_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/andrew/catkin_ws/src/aruco/msg/DetectedMarkerArray.msg" NAME_WE)
add_dependencies(aruco_generate_messages_py _aruco_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(aruco_genpy)
add_dependencies(aruco_genpy aruco_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS aruco_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/aruco)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/aruco
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
add_dependencies(aruco_generate_messages_cpp std_msgs_generate_messages_cpp)
add_dependencies(aruco_generate_messages_cpp geometry_msgs_generate_messages_cpp)

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/aruco)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/aruco
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
add_dependencies(aruco_generate_messages_lisp std_msgs_generate_messages_lisp)
add_dependencies(aruco_generate_messages_lisp geometry_msgs_generate_messages_lisp)

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/aruco)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/aruco\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/aruco
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
add_dependencies(aruco_generate_messages_py std_msgs_generate_messages_py)
add_dependencies(aruco_generate_messages_py geometry_msgs_generate_messages_py)
