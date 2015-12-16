
(cl:in-package :asdf)

(defsystem "aruco-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :geometry_msgs-msg
)
  :components ((:file "_package")
    (:file "marker_info" :depends-on ("_package_marker_info"))
    (:file "_package_marker_info" :depends-on ("_package"))
    (:file "DetectedMarkerArray" :depends-on ("_package_DetectedMarkerArray"))
    (:file "_package_DetectedMarkerArray" :depends-on ("_package"))
    (:file "DetectedMarker" :depends-on ("_package_DetectedMarker"))
    (:file "_package_DetectedMarker" :depends-on ("_package"))
  ))