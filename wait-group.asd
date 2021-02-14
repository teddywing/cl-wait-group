;;; Copyright (c) 2021  Teddy Wing
;;;
;;; This Source Code Form is subject to the terms of the Mozilla Public
;;; License, v. 2.0. If a copy of the MPL was not distributed with this
;;; file, You can obtain one at https://mozilla.org/MPL/2.0/.

(asdf:defsystem wait-group
  :description "Wait for a collection of jobs to finish"
  :version "0.1.0"
  :license "MPL-2.0"

  :components ((:module "src"
                :serial t
                :components ((:file "package")
                             (:file "wait-group")))))
