#lang sicp

(define (is-smallest target a b)
  (and (< target a) (< target b)))

(define (sum-squares x y)
  (+ (* x x) (* y y)))

(define (sum-largest-squares x y z)
  (cond ((is-smallest x y z) (sum-squares y z))
        ((is-smallest y x z) (sum-squares x z))
        (else (sum-squares x y))))

; true
(= (sum-largest-squares 2 3 4) (sum-largest-squares 3 2 4) (sum-largest-squares 3 4 2))

; Old solution...
; While shorter, I think splitting the conditional makes the logic messier than is worth.
(define (sum-largest-squares-2 x y z)
  (if (> x y)
      (sum-squares x (if (> y z) y z))
      (sum-squares y (if (> x z) x z))))

(= (sum-largest-squares-2 2 3 4) (sum-largest-squares-2 3 2 4) (sum-largest-squares-2 3 4 2))
