(in-package :wait-group)

(defclass wait-group ()
  ((counter
     :initform 0
     :accessor counter)))

(defun make-wait-group ()
  (make-instance 'wait-group))

(defgeneric add (wait-group &optional amount)
  (:documentation ""))

(defmethod add ((wait-group wait-group) &optional (amount 1))
  (incf (counter wait-group) amount))

(defgeneric done (wait-group)
  (:documentation ""))

(defmethod done ((wait-group wait-group))
  (decf (counter wait-group)))

(defgeneric wait (wait-group)
  (:documentation ""))

(defmethod wait ((wait-group wait-group))
  (loop until (= (counter wait-group) 0)))
