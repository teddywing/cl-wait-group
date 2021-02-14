(asdf:defsystem wait-group
  :description "Wait for a collection of jobs to finish"
  :version "0.0.1"

  :components ((:module "src"
                :serial t
                :components ((:file "package")
                             (:file "wait-group")))))
