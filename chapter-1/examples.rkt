#lang sicp
;Expressions
(+ (* 3
      (+ (* 2 4)
         (+ 3 5)))
   (+ (- 10 7)
      6))
;Naming
(define pi 3.141592653579)
(define radius 10)
(define circumference (* 2 pi radius))
circumference

(define (square x)
  (* x x))

(define area (* pi (square radius)))
area
(define (sum-of-squares x y)
  (+ (square x) (square y)))
(sum-of-squares 3 4)

;Conditionals

(define (abs x)
  (cond ((> x 0) x)
        ((= x 0) x)
        ((< x 0) (- x))))
(abs -4)
(define (abs2 x)
  (if (< x 0)
      (- x)
      x))
(abs2 -7)

(define (>= x y)
  (or (> x y) (= x y)))

(>= 7 4)
