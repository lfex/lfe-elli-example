(defmodule lfe-elli-example-tests
  "lfe-elli-example unit tests.")

(include-lib "ltest/include/ltest-macros.lfe")

(deftest index-status
  (is-match `#(ok [] ,_body)
            (elli_test:call 'GET #"/" [] #""
                            '(#(callback lfe-elli-example-router)))))
