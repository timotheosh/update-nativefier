(defpackage update-nativefier
  (:use :cl)
  (:export :-main))
(in-package :update-nativefier)

(opts:define-opts
  (:name :help
   :description "print this help text"
   :short #\h
   :long "help"))

(defun unknown-option (condition)
  (format t "warning: ~s option is unknown!~%" (opts:option condition))
  (invoke-restart 'opts:skip-option))

(defun -main (&rest args)
  (declare (ignorable args))
  (multiple-value-bind (options args)
      (handler-case
          (handler-bind ((opts:unknown-option #'unknown-option))
            (opts:get-opts)))
    (cond ((getf options :help) 
	   (progn (opts:describe 
		       :prefix (format nil "update-nativefier Update nativefier applications")
                       :usage-of "update-nativefier INPUT")
                  (opts:exit 1)))
          ((not (= (length args) 1)) 
	   (progn (format t "Can only process one argument!")
                  (opts:describe
                       :prefix (format nil "update-nativefier Update nativefier applications")
                       :usage-of "update-nativefier INPUT")
                  (opts:exit 1)))
          (t 
	    (format t "Hello, ~A!~%" (first args))))))
