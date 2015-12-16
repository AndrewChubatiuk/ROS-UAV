# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "mofs: 2 messages, 1 services")

set(MSG_I_FLAGS "-Imofs:/home/andrew/catkin_ws/src/mofs/msg;-Istd_msgs:/opt/ros/indigo/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(genlisp REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(mofs_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/andrew/catkin_ws/src/mofs/msg/input.msg" NAME_WE)
add_custom_target(_mofs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "mofs" "/home/andrew/catkin_ws/src/mofs/msg/input.msg" ""
)

get_filename_component(_filename "/home/andrew/catkin_ws/src/mofs/srv/FuzzyControl_IO.srv" NAME_WE)
add_custom_target(_mofs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "mofs" "/home/andrew/catkin_ws/src/mofs/srv/FuzzyControl_IO.srv" ""
)

get_filename_component(_filename "/home/andrew/catkin_ws/src/mofs/msg/output.msg" NAME_WE)
add_custom_target(_mofs_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "mofs" "/home/andrew/catkin_ws/src/mofs/msg/output.msg" ""
)

#
#  langs = gencpp;genlisp;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(mofs
  "/home/andrew/catkin_ws/src/mofs/msg/output.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/mofs
)
_generate_msg_cpp(mofs
  "/home/andrew/catkin_ws/src/mofs/msg/input.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/mofs
)

### Generating Services
_generate_srv_cpp(mofs
  "/home/andrew/catkin_ws/src/mofs/srv/FuzzyControl_IO.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/mofs
)

### Generating Module File
_generate_module_cpp(mofs
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/mofs
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(mofs_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(mofs_generate_messages mofs_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/andrew/catkin_ws/src/mofs/msg/input.msg" NAME_WE)
add_dependencies(mofs_generate_messages_cpp _mofs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/andrew/catkin_ws/src/mofs/srv/FuzzyControl_IO.srv" NAME_WE)
add_dependencies(mofs_generate_messages_cpp _mofs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/andrew/catkin_ws/src/mofs/msg/output.msg" NAME_WE)
add_dependencies(mofs_generate_messages_cpp _mofs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(mofs_gencpp)
add_dependencies(mofs_gencpp mofs_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS mofs_generate_messages_cpp)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(mofs
  "/home/andrew/catkin_ws/src/mofs/msg/output.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/mofs
)
_generate_msg_lisp(mofs
  "/home/andrew/catkin_ws/src/mofs/msg/input.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/mofs
)

### Generating Services
_generate_srv_lisp(mofs
  "/home/andrew/catkin_ws/src/mofs/srv/FuzzyControl_IO.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/mofs
)

### Generating Module File
_generate_module_lisp(mofs
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/mofs
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(mofs_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(mofs_generate_messages mofs_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/andrew/catkin_ws/src/mofs/msg/input.msg" NAME_WE)
add_dependencies(mofs_generate_messages_lisp _mofs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/andrew/catkin_ws/src/mofs/srv/FuzzyControl_IO.srv" NAME_WE)
add_dependencies(mofs_generate_messages_lisp _mofs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/andrew/catkin_ws/src/mofs/msg/output.msg" NAME_WE)
add_dependencies(mofs_generate_messages_lisp _mofs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(mofs_genlisp)
add_dependencies(mofs_genlisp mofs_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS mofs_generate_messages_lisp)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(mofs
  "/home/andrew/catkin_ws/src/mofs/msg/output.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/mofs
)
_generate_msg_py(mofs
  "/home/andrew/catkin_ws/src/mofs/msg/input.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/mofs
)

### Generating Services
_generate_srv_py(mofs
  "/home/andrew/catkin_ws/src/mofs/srv/FuzzyControl_IO.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/mofs
)

### Generating Module File
_generate_module_py(mofs
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/mofs
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(mofs_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(mofs_generate_messages mofs_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/andrew/catkin_ws/src/mofs/msg/input.msg" NAME_WE)
add_dependencies(mofs_generate_messages_py _mofs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/andrew/catkin_ws/src/mofs/srv/FuzzyControl_IO.srv" NAME_WE)
add_dependencies(mofs_generate_messages_py _mofs_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/andrew/catkin_ws/src/mofs/msg/output.msg" NAME_WE)
add_dependencies(mofs_generate_messages_py _mofs_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(mofs_genpy)
add_dependencies(mofs_genpy mofs_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS mofs_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/mofs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/mofs
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
add_dependencies(mofs_generate_messages_cpp std_msgs_generate_messages_cpp)

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/mofs)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/mofs
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
add_dependencies(mofs_generate_messages_lisp std_msgs_generate_messages_lisp)

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/mofs)
  install(CODE "execute_process(COMMAND \"/usr/bin/python\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/mofs\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/mofs
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
add_dependencies(mofs_generate_messages_py std_msgs_generate_messages_py)
