#lang sicp

(define (square x)
  (* x x))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (average x y)
  (/ (+ x y) 2))

(define (improve guess x)
  (average guess (/ x guess)))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
                 x)))

(define (sqrt x)
  (sqrt-iter 1.0 x))

; For very small numbers the value of 'good-enough' is far too large
; As an example:
(sqrt .000001)
; yields .03126 when the correct solution is 0.001

;The opposite problem occurs with very large numbers, there is only so much precision
;so the gap in guess values for very large numbers may never shrink below 0.001

;hangs forever: (sqrt 100000000000000000)

;reports two numbers have the same sqrt
(= (sqrt 1000000000000000000) (sqrt 1000000000000000002))
; true

;instead we can compare the % difference between guesses and stop when the diff is sufficiently small
;in this case we stop when the values are within 1% of each other.

(define (better-enough? guess x)
  (< (/ (abs (- (improve guess x) guess)) guess) .01))

(define (sqrt-iter-2 guess x)
  (if (better-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
                 x)))

(define (sqrt-2 x)
  (sqrt-iter-2 1.0 x))

(sqrt-2 .000001)
(= (sqrt-2 1000000000000000000) (sqrt-2 1000000000000000002))
