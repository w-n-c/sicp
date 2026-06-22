#lang sicp

(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

; There is a conditional on the operator that decides whether b should be added or
; subtracted from a: subraction in the case of a negative value for b, addition otherwise.

;When evaluated:

; first evalue the operator and operands then apply the result:
(a-plus-abs-b 3 -4)
;3 -4 are applied to the definition:
((if (> -4 0) + -) 3 -4)
;the operand of the if statement is evaluated first
((if #f + -) 3 -4)
;then the if statement is applied
(- 3 -4)
;no remaining foms to evaluate so apply again

