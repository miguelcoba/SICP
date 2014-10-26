(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

(new-if (= 2 3) 0 5)

(new-if (= 1 1) 0 5)

(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
	  guess
	  (sqrt-iter (improve guess x)
		     x)))

; The new-if procedure usa applicative-order evaluation meaning that
; evaluate all the subexpressions before applying the operator to the
; values of the arguments.
; In the case of sqrt-iter, the evalutaion of the new-if evaluates the
; three subexpressions, and when evaluation the third one:
;  (sqrt-iter (improve guess x) x)
; it call itself again, resulting in an infinite recursive non-ending
; call to sqrt-iter. The method never returns a value.
