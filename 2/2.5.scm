(define (cons a b)
  (* (expt 2 a)
     (expt 3 b)))

(define (count-exact-divisions n d)
  (define (iter count result)
    (if (zero? (remainder result d))
	(iter (+ count 1) (/ result d))
	count))
  (iter 0 n))

(define (car z)
  (count-exact-divisions z 2))

(define (cdr z)
  (count-exact-divisions z 3))

(car (cons 3 5))

(cdr (cons 4 3))

