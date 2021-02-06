;;;; TODO

;; TODO: Add a wg:clear

(in-package :wait-group)

(defclass wait-group ()
  ((counter
     :initform 0
     :accessor counter
     :documentation "TODO"))

  (:documentation "TODO"))

(defmethod print-object ((object wait-group) stream)
  (print-unreadable-object (object stream :type t)
    (with-slots (counter) object
      (format stream ":counter ~s" counter))))

(defun make-wait-group ()
  "TODO"
  (make-instance 'wait-group))

(defgeneric add (wait-group &optional amount)
  (:documentation "TODO"))

(defmethod add ((wait-group wait-group) &optional (amount 1))
  "TODO"
  (incf (counter wait-group) amount))

(defgeneric done (wait-group)
  (:documentation "TODO"))

(defmethod done ((wait-group wait-group))
  "TODO"
  (decf (counter wait-group)))

(defgeneric wait (wait-group)
  (:documentation "TODO"))

(defmethod wait ((wait-group wait-group))
  "TODO"
  (loop until (<= (counter wait-group) 0)))
