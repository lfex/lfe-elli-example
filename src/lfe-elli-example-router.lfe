(defmodule lfe-elli-example-router
  (behaviour elli_handler)
  (export (handle 2) (handle_event 3)))

(defun handle (req _args)
  "Handle an HTTP request.
  If the `path` is the empty list, i.e. `/`, respond with the index template,
  otherwise `404`."
  (let ((path   (elli_request:path req))
        (method (elli_request:method req)))
    (route method path req)))

(defun handle_event (_event _data _args)
  "Return the atom `ok`."
  'ok)

(defun route
  (['GET     []    req]  (lfe-elli-example-handler-index:init req))
  ([_method _path _req] #(404 [] #"Not Found")))
