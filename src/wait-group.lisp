;;;; TODO

(in-package :wait-group)

(defclass wait-group ()
  ((counter
     :initform 0
     :accessor counter
     :documentation "Count of jobs to wait for."))

  (:documentation "Block waiting for jobs to finish."))

(defmethod print-object ((object wait-group) stream)
  (print-unreadable-object (object stream :type t)
    (with-slots (counter) object
      (format stream ":counter ~s" counter))))

(defun make-wait-group ()
  "Make a wait-group instance."
  (make-instance 'wait-group))

(defgeneric add (wait-group &optional amount)
  (:documentation "Track a new job in the group."))

(defmethod add ((wait-group wait-group) &optional (amount 1))
  (incf (counter wait-group) amount))

(defgeneric done (wait-group)
  (:documentation "Stop tracking a job in the group."))

(defmethod done ((wait-group wait-group))
  (decf (counter wait-group)))

(defgeneric wait (wait-group)
  (:documentation "Block waiting for tracked jobs to finish."))

(defmethod wait ((wait-group wait-group))
  (loop until (<= (counter wait-group) 0)))
