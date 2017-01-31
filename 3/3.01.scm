(define (make-accumulator initial)
  (lambda (amount)
    (begin (set! initial (+ initial amount))
	   initial)))

(define A (make-accumulator 5))

(A 10)
;Value: 15

(A 10)
;Value: 25

