(define (square x) (* x x))

(define (even? n)
  (= (remainder n 2) 0))

(define (fast-expt-iter b n a)
  (cond ((= n 0) a)
	((even? n) (fast-expt-iter (square b) (/ n 2) a))
	(else (fast-expt-iter b (- n 1) (* a b)))))

(define (fast-expt b n)
  (fast-expt-iter b n 1))

(fast-expt 2 4)
(fast-expt-iter 2 4 1)
(fast-expt-iter (square 2) (/ 4 2) 1)
(fast-expt-iter 4 2 1)
(fast-expt-iter (square 4) (/ 2 2) 1)
(fast-expt-iter 16 1 1)
(fast-expt-iter 16 (- 1 1) (* 16 1))
(fast-expt-iter 16 0 16)
16