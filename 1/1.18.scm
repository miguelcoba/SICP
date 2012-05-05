(define (even? x) (= (remainder x 2) 0))
(define (double x) (+ x x))
(define (halve x) (/ x 2))

(define (* x y)
  (mult-iter x y 0))

(define (mult-iter x y a)
  (cond ((= y 0) a)
	((even? y) (mult-iter (double x) (halve y) a))
	(else (mult-iter x (- y 1) (+ a x)))))