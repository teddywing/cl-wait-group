;;; Copyright (c) 2021  Teddy Wing
;;;
;;; This Source Code Form is subject to the terms of the Mozilla Public
;;; License, v. 2.0. If a copy of the MPL was not distributed with this
;;; file, You can obtain one at https://mozilla.org/MPL/2.0/.

(defpackage :wait-group
  (:nicknames :wg)

  (:use :cl)

  (:export #:make-wait-group
           #:add
           #:done
           #:wait))
