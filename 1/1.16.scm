(define (fast-expt b n)
  (fast-expt-iter b n 1))

(define (fast-expt-iter b n a)
  (cond ((= n 0) a)
	((even? n) (fast-expt-iter (square b) (/ n 2) a))
	(else (fast-expt-iter b (- n 1) (* b a)))))

(fast-expt 2 4)
(fast-expt-iter 2 4 1)
(fast-expt-iter (square 2) (/ 4 2) 1)
(fast-expt-iter 4 2 1)
(fast-expt-iter (square 4) (/ 2 2) 1)
(fast-expt-iter 16 1 1)
(fast-expt-iter 16 0 (* 16 1))
(fast-expt-iter 16 0 16)
16

(fast-expt-iter 2 3)
(fast-expt-iter 2 3 1)
(fast-expt-iter 2 (- 3 1) (* 2 1))
(fast-expt-iter 2 2 2)
(fast-expt-iter (square 2) (/ 2 2) 2)
(fast-expt-iter 4 1 2)
(fast-expt-iter 4 (- 1 1) (* 4 2))
(fast-expt-iter 4 0 8)
8
	     
