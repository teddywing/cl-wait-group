(defpackage :wait-group
  (:nicknames :wg)

  (:use :cl)

  (:export #:make-wait-group
           #:add
           #:done
           #:wait))
