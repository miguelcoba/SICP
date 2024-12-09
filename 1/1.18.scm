(define (double x)
  (+ x x))

(define (halve x)
  (/ x 2))

(define (* a b)
  (fast-mult-iter a b 0))

(define (fast-mult-iter a b product)
  (cond ((= b 0) product)
	((even? b) (fast-mult-iter (double a) (halve b) product))
	(else (fast-mult-iter a (- b 1) (+ product a)))))
