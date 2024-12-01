(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
	(else else-clause)))

(new-if (= 2 3) 0 5)

(new-if (= 1 1) 0 5)

(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
	  guess
	  (sqrt-iter (improve guess x) x)))

;; The new-if procedure uses appicative-order evaluation meaning that
;; evalutes all the operands before applying the operator to the values of
;; the arguments.
;; In the case of sqrt-iter, there are three subexpressions and when evaluating the third one
;; it calls itself again, resulting in an infinite recursive call to sqrt-iter.
;; It never ends or returns a value
