;;;; Wait group provides a way to block waiting for jobs to finish.

;;; Example:
;;;
;;; The following initialises a WebSocket client, sends a message, and waits
;;; for a response.
;;;
;;; (defvar *client* (wsd:make-client "ws://localhost:5555/"))
;;; (defvar *wg* (wait-group:make-wait-group))
;;;
;;; (wsd:start-connection *client*)
;;;
;;; (wsd:on :message *client* #'(lambda (message)
;;;                               (format t "Received: ~a~%" message)
;;;                               (wait-group:done *wg*))
;;;
;;; (wsd:send *client* "Sending")
;;; (wait-group:add *wg*)
;;;
;;; (wait-group:wait *wg*)
;;;
;;; (wsd:close-connection *client*)

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
