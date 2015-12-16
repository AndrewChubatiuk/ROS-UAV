; Auto-generated. Do not edit!


(cl:in-package vision_control_4_uav-msg)


;//! \htmlinclude codeCommand.msg.html

(cl:defclass <codeCommand> (roslisp-msg-protocol:ros-message)
  ((code
    :reader code
    :initarg :code
    :type cl:integer
    :initform 0))
)

(cl:defclass codeCommand (<codeCommand>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <codeCommand>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'codeCommand)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name vision_control_4_uav-msg:<codeCommand> is deprecated: use vision_control_4_uav-msg:codeCommand instead.")))

(cl:ensure-generic-function 'code-val :lambda-list '(m))
(cl:defmethod code-val ((m <codeCommand>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vision_control_4_uav-msg:code-val is deprecated.  Use vision_control_4_uav-msg:code instead.")
  (code m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <codeCommand>) ostream)
  "Serializes a message object of type '<codeCommand>"
  (cl:let* ((signed (cl:slot-value msg 'code)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <codeCommand>) istream)
  "Deserializes a message object of type '<codeCommand>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'code) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<codeCommand>)))
  "Returns string type for a message object of type '<codeCommand>"
  "vision_control_4_uav/codeCommand")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'codeCommand)))
  "Returns string type for a message object of type 'codeCommand"
  "vision_control_4_uav/codeCommand")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<codeCommand>)))
  "Returns md5sum for a message object of type '<codeCommand>"
  "5e8de1acec506dc927ef4d2e8193b594")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'codeCommand)))
  "Returns md5sum for a message object of type 'codeCommand"
  "5e8de1acec506dc927ef4d2e8193b594")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<codeCommand>)))
  "Returns full string definition for message of type '<codeCommand>"
  (cl:format cl:nil "#0: means hover, 1: follow the last code deteted, other number: follow this specific code~%int32 code~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'codeCommand)))
  "Returns full string definition for message of type 'codeCommand"
  (cl:format cl:nil "#0: means hover, 1: follow the last code deteted, other number: follow this specific code~%int32 code~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <codeCommand>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <codeCommand>))
  "Converts a ROS message object to a list"
  (cl:list 'codeCommand
    (cl:cons ':code (code msg))
))
