; Auto-generated. Do not edit!


(cl:in-package mofs-srv)


;//! \htmlinclude FuzzyControl_IO-request.msg.html

(cl:defclass <FuzzyControl_IO-request> (roslisp-msg-protocol:ros-message)
  ((inputs
    :reader inputs
    :initarg :inputs
    :type (cl:vector cl:float)
   :initform (cl:make-array 3 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass FuzzyControl_IO-request (<FuzzyControl_IO-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <FuzzyControl_IO-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'FuzzyControl_IO-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name mofs-srv:<FuzzyControl_IO-request> is deprecated: use mofs-srv:FuzzyControl_IO-request instead.")))

(cl:ensure-generic-function 'inputs-val :lambda-list '(m))
(cl:defmethod inputs-val ((m <FuzzyControl_IO-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mofs-srv:inputs-val is deprecated.  Use mofs-srv:inputs instead.")
  (inputs m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <FuzzyControl_IO-request>) ostream)
  "Serializes a message object of type '<FuzzyControl_IO-request>"
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'inputs))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <FuzzyControl_IO-request>) istream)
  "Deserializes a message object of type '<FuzzyControl_IO-request>"
  (cl:setf (cl:slot-value msg 'inputs) (cl:make-array 3))
  (cl:let ((vals (cl:slot-value msg 'inputs)))
    (cl:dotimes (i 3)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<FuzzyControl_IO-request>)))
  "Returns string type for a service object of type '<FuzzyControl_IO-request>"
  "mofs/FuzzyControl_IORequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'FuzzyControl_IO-request)))
  "Returns string type for a service object of type 'FuzzyControl_IO-request"
  "mofs/FuzzyControl_IORequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<FuzzyControl_IO-request>)))
  "Returns md5sum for a message object of type '<FuzzyControl_IO-request>"
  "fba685fbdda96b6ff62d5238836ec32a")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'FuzzyControl_IO-request)))
  "Returns md5sum for a message object of type 'FuzzyControl_IO-request"
  "fba685fbdda96b6ff62d5238836ec32a")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<FuzzyControl_IO-request>)))
  "Returns full string definition for message of type '<FuzzyControl_IO-request>"
  (cl:format cl:nil "~%float32[3] inputs~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'FuzzyControl_IO-request)))
  "Returns full string definition for message of type 'FuzzyControl_IO-request"
  (cl:format cl:nil "~%float32[3] inputs~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <FuzzyControl_IO-request>))
  (cl:+ 0
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'inputs) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <FuzzyControl_IO-request>))
  "Converts a ROS message object to a list"
  (cl:list 'FuzzyControl_IO-request
    (cl:cons ':inputs (inputs msg))
))
;//! \htmlinclude FuzzyControl_IO-response.msg.html

(cl:defclass <FuzzyControl_IO-response> (roslisp-msg-protocol:ros-message)
  ((output
    :reader output
    :initarg :output
    :type cl:float
    :initform 0.0))
)

(cl:defclass FuzzyControl_IO-response (<FuzzyControl_IO-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <FuzzyControl_IO-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'FuzzyControl_IO-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name mofs-srv:<FuzzyControl_IO-response> is deprecated: use mofs-srv:FuzzyControl_IO-response instead.")))

(cl:ensure-generic-function 'output-val :lambda-list '(m))
(cl:defmethod output-val ((m <FuzzyControl_IO-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader mofs-srv:output-val is deprecated.  Use mofs-srv:output instead.")
  (output m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <FuzzyControl_IO-response>) ostream)
  "Serializes a message object of type '<FuzzyControl_IO-response>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'output))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <FuzzyControl_IO-response>) istream)
  "Deserializes a message object of type '<FuzzyControl_IO-response>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'output) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<FuzzyControl_IO-response>)))
  "Returns string type for a service object of type '<FuzzyControl_IO-response>"
  "mofs/FuzzyControl_IOResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'FuzzyControl_IO-response)))
  "Returns string type for a service object of type 'FuzzyControl_IO-response"
  "mofs/FuzzyControl_IOResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<FuzzyControl_IO-response>)))
  "Returns md5sum for a message object of type '<FuzzyControl_IO-response>"
  "fba685fbdda96b6ff62d5238836ec32a")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'FuzzyControl_IO-response)))
  "Returns md5sum for a message object of type 'FuzzyControl_IO-response"
  "fba685fbdda96b6ff62d5238836ec32a")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<FuzzyControl_IO-response>)))
  "Returns full string definition for message of type '<FuzzyControl_IO-response>"
  (cl:format cl:nil "float32 output~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'FuzzyControl_IO-response)))
  "Returns full string definition for message of type 'FuzzyControl_IO-response"
  (cl:format cl:nil "float32 output~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <FuzzyControl_IO-response>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <FuzzyControl_IO-response>))
  "Converts a ROS message object to a list"
  (cl:list 'FuzzyControl_IO-response
    (cl:cons ':output (output msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'FuzzyControl_IO)))
  'FuzzyControl_IO-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'FuzzyControl_IO)))
  'FuzzyControl_IO-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'FuzzyControl_IO)))
  "Returns string type for a service object of type '<FuzzyControl_IO>"
  "mofs/FuzzyControl_IO")