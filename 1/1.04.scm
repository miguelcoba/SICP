(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

;; Evaluation
;; The evaluation will apply the procedur that is the value of the
;; leftmost subexpression (the operator) to the arguments that are
;; the values of the other subexpressions (the operands)
;; Here the leftmost subexpression is the if form, that depending
;; on the value of be, will result in the + or the - primitive
;; expressions.
;; Example
(a-plus-abs-b 1 3)
((if (> 3 0) + -) 1 3)
((if #t + -) 1 3)
(+ 1 3)
4

(a-plus-abs-b 1 -3)
((if (> -3 0) + -) 1 -3)
((if #f + -) 1 -3)
(- 1 -3)
4
