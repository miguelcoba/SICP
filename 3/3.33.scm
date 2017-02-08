;; c = (a + b) / 2
;; 2c = a + b
(define (averager a b c)
  (let ((sum (make-connector))
	(const (make-connector)))
    (adder a b sum)
    (constant 2 const)
    (multipier const c sum)
    'ok))

