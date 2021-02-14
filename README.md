wait-group
==========

Wait group provides a way to block while waiting for jobs to finish. It’s
designed to mimic Go’s [sync.WaitGroup] in Common Lisp.


## Example
The following initialises a WebSocket client, sends a message, and waits for a
response.

``` common-lisp
(defvar *client* (wsd:make-client "ws://localhost:5555/"))
(defvar *wg* (wait-group:make-wait-group))

(wsd:start-connection *client*)

(wsd:on :message *client* #'(lambda (message)
                              (format t "Received: ~a~%" message)
                              (wait-group:done *wg*))

(wsd:send *client* "Sending")
(wait-group:add *wg*)

(wait-group:wait *wg*)

(wsd:close-connection *client*)
```


## Install
Clone the project to your ASDF or Quicklisp source registry:

	$ git clone https://github.com/teddywing/cl-wait-group.git ~/quicklisp/local-projects/wait-group


## License
Copyright © 2021 Teddy Wing. Licensed under the Mozilla Public License v. 2.0
(see the included LICENSE file).


[sync.WaitGroup]: https://pkg.go.dev/sync#WaitGroup
