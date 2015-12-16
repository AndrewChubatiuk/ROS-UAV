; Auto-generated. Do not edit!


(cl:in-package mofs-msg)


;//! \htmlinclude output.msg.html

(cl:defclass <output> (roslisp-msg-protocol:ros-message)
  ((value
    :reader value
    :initarg :value
    :type cl:float
    :initform 0.0))
)

(cl:defclass output (<output>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <output>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'output)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name mofs-msg:<output> is deprecated: use mofs-msg:output instead.")))

(cl:ensure-generic-function 'value-val :lambda-list '(m))
(cl:defmethod value-val ((m <output>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mofs-msg:value-val is deprecated.  Use mofs-msg:value instead.")
  (value m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <output>) ostream)
  "Serializes a message object of type '<output>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'value))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <output>) istream)
  "Deserializes a message object of type '<output>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'value) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<output>)))
  "Returns string type for a message object of type '<output>"
  "mofs/output")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'output)))
  "Returns string type for a message object of type 'output"
  "mofs/output")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<output>)))
  "Returns md5sum for a message object of type '<output>"
  "0aca93dcf6d857f0e5a0dc6be1eaa9fb")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'output)))
  "Returns md5sum for a message object of type 'output"
  "0aca93dcf6d857f0e5a0dc6be1eaa9fb")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<output>)))
  "Returns full string definition for message of type '<output>"
  (cl:format cl:nil "float32 value~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'output)))
  "Returns full string definition for message of type 'output"
  (cl:format cl:nil "float32 value~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <output>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <output>))
  "Converts a ROS message object to a list"
  (cl:list 'output
    (cl:cons ':value (value msg))
))
