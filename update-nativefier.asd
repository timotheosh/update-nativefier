(defsystem "update-nativefier"
  :version "0.1.0"
  :author "Tim Hawes <trhawes@gmail.com>"
  :license "MIT"
  :depends-on ("cl-ppcre"
               "unix-opts")
  :components ((:module "src"
                :components
                ((:file "main"))))
  :description "Update nativefier applications"
  :build-operation "asdf:program-op"
  :build-pathname "target/update-nativefier"
  :entry-point "update-nativefier:-main"
  :in-order-to ((test-op (test-op "update-nativefier/tests"))))

(defsystem "update-nativefier/tests"
  :author "Tim Hawes <trhawes@gmail.com>"
  :license "MIT"
  :depends-on ("update-nativefier"
               "fiveam")
  :components ((:module "tests"
                :components
                ((:file "main"))))
  :description "Test system for update-nativefier"
  :perform (test-op (op c) (symbol-call :fiveam :run! (find-symbol* :all-tests :update-nativefier/tests))))
