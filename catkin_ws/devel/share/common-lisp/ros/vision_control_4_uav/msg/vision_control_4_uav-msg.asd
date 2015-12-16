
(cl:in-package :asdf)

(defsystem "vision_control_4_uav-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "codeCommand" :depends-on ("_package_codeCommand"))
    (:file "_package_codeCommand" :depends-on ("_package"))
  ))