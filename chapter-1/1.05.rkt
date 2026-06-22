#lang sicp

(define (p) (p))

(define (test x y)
  (if (= x 0)
      0
      y))

;In applicative-order:
(test 0 (p))
;results in (p) being evaluted before being applied to the if statement
;but evaluating (p) returns (p) triggering an infinite loop as the interpreter
;tries to resolve the value before applying it to the body of the function

;In normal-order:
(test 0 (p))
;results in:
(if (= 0 0)
    0
    (p))
;the function is expanded first, and the if special form short circuits the evaluation of (p)
(if #t 0 (p))
; meaning the test successfully completes
0
