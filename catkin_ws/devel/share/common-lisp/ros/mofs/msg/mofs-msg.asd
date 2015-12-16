
(cl:in-package :asdf)

(defsystem "mofs-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "input" :depends-on ("_package_input"))
    (:file "_package_input" :depends-on ("_package"))
    (:file "output" :depends-on ("_package_output"))
    (:file "_package_output" :depends-on ("_package"))
  ))