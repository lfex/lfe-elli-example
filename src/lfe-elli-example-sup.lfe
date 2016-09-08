(defmodule lfe-elli-example-sup
  (behaviour supervisor)
  ;; API
  (export (start_link 0))
  ;; Supervisor callbacks
  (export (init 1)))

(defun start_link () (supervisor:start_link `#(local ,(MODULE)) (MODULE) ()))

(defun init (args)
  (let* ((server   #(lfe_elli_example
                     #(elli start_link [[#(callback lfe-elli-example-router)
                                          #(port 3000)]])
                     permanent
                     5000
                     worker
                     [elli]))
         (children `(,server))
         (restart-strategy #(one_for_one 3 1)))
    `#(ok #(,restart-strategy ,children))))
