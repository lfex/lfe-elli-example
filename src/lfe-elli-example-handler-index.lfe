(defmodule lfe-elli-example-handler-index
  "Index handler."
  (export (init 1)))

(defun init (req)
  "Render the index template as the body and return an Elli response."
  (let ((`#(ok ,template) (index_dtl:render)))
    `#(ok [] mtemplate)))
