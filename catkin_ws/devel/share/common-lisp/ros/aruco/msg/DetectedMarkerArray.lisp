; Auto-generated. Do not edit!


(cl:in-package aruco-msg)


;//! \htmlinclude DetectedMarkerArray.msg.html

(cl:defclass <DetectedMarkerArray> (roslisp-msg-protocol:ros-message)
  ((markers
    :reader markers
    :initarg :markers
    :type (cl:vector aruco-msg:DetectedMarker)
   :initform (cl:make-array 0 :element-type 'aruco-msg:DetectedMarker :initial-element (cl:make-instance 'aruco-msg:DetectedMarker))))
)

(cl:defclass DetectedMarkerArray (<DetectedMarkerArray>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <DetectedMarkerArray>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'DetectedMarkerArray)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name aruco-msg:<DetectedMarkerArray> is deprecated: use aruco-msg:DetectedMarkerArray instead.")))

(cl:ensure-generic-function 'markers-val :lambda-list '(m))
(cl:defmethod markers-val ((m <DetectedMarkerArray>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader aruco-msg:markers-val is deprecated.  Use aruco-msg:markers instead.")
  (markers m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <DetectedMarkerArray>) ostream)
  "Serializes a message object of type '<DetectedMarkerArray>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'markers))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'markers))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <DetectedMarkerArray>) istream)
  "Deserializes a message object of type '<DetectedMarkerArray>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'markers) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'markers)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'aruco-msg:DetectedMarker))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<DetectedMarkerArray>)))
  "Returns string type for a message object of type '<DetectedMarkerArray>"
  "aruco/DetectedMarkerArray")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'DetectedMarkerArray)))
  "Returns string type for a message object of type 'DetectedMarkerArray"
  "aruco/DetectedMarkerArray")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<DetectedMarkerArray>)))
  "Returns md5sum for a message object of type '<DetectedMarkerArray>"
  "5b14ecbc39d258014a7e7c8e73c5ee55")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'DetectedMarkerArray)))
  "Returns md5sum for a message object of type 'DetectedMarkerArray"
  "5b14ecbc39d258014a7e7c8e73c5ee55")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<DetectedMarkerArray>)))
  "Returns full string definition for message of type '<DetectedMarkerArray>"
  (cl:format cl:nil "aruco/DetectedMarker[] markers~%================================================================================~%MSG: aruco/DetectedMarker~%int32 id~%geometry_msgs/PoseStamped pose~%================================================================================~%MSG: geometry_msgs/PoseStamped~%# A Pose with reference coordinate frame and timestamp~%Header header~%Pose pose~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of postion and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'DetectedMarkerArray)))
  "Returns full string definition for message of type 'DetectedMarkerArray"
  (cl:format cl:nil "aruco/DetectedMarker[] markers~%================================================================================~%MSG: aruco/DetectedMarker~%int32 id~%geometry_msgs/PoseStamped pose~%================================================================================~%MSG: geometry_msgs/PoseStamped~%# A Pose with reference coordinate frame and timestamp~%Header header~%Pose pose~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%# 0: no frame~%# 1: global frame~%string frame_id~%~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of postion and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <DetectedMarkerArray>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'markers) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <DetectedMarkerArray>))
  "Converts a ROS message object to a list"
  (cl:list 'DetectedMarkerArray
    (cl:cons ':markers (markers msg))
))
