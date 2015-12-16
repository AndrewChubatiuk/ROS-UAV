
(cl:in-package :asdf)

(defsystem "mofs-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "FuzzyControl_4_IO" :depends-on ("_package_FuzzyControl_4_IO"))
    (:file "_package_FuzzyControl_4_IO" :depends-on ("_package"))
    (:file "FuzzyControl_IO" :depends-on ("_package_FuzzyControl_IO"))
    (:file "_package_FuzzyControl_IO" :depends-on ("_package"))
  ))