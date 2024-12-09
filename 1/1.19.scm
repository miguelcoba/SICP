;; Tpq(a,b) = a <- bq + aq + ap
;;            b <- bp + aq
;;
;; Tp'q'(a,b) = a <- (bp + aq)q + (bq + aq + ap)q + (bq + aq + ap)p
;;              b <- (bp + aq)p + (bq + aq + ap)q
;; Tp'q'(a,b) = a <- bpq + aqq + bqq + aqq + apq + bqp + aqp + app
;;              b <- bpp + aqp + bqq + aqq + apq
;; Tp'q'(a,b) = a <- bpq + aqq + bqq + aqq + apq + bqp + aqp + app
;;              b <- bpp + bqq + aqp + aqq + apq
;; Tp'q'(a,b) = a <- bpq + aqq + bqq + aqq + apq + bqp + aqp + app
;;              b <- b(pp + qq) + a(qp + qq + pq)
;; Tp'q'(a,b) = a <- bpq + bqq + bpq + aqp + aqq + apq + app + aqq
;;              b <- b(pp + qq) + a(qp + qq + pq)
;; Tp'q'(a,b) = a <- b(pq + qq + pq) + a(qp + qq + pq) + a(pp + qq)
;;              b <- b(pp + qq) + a(qp + qq + pq)
;; Tp'q'(a,b) = a <- b(qp + qq + pq) + a(qp + qq + pq) + a(pp + qq)
;;              b <- b(pp + qq) + a(qp + qq + pq)
;; p' <- pp + qq
;; q' <- qp + qq + pq
;; Tp'q'(a,b) = a <- b(q') + a(q') + a(p')
;;              b <- b(p') + a(q')

(define (fib n)
  (fib-iter 1 0 0 1 n))

(define (fib-iter a b p q count)
  (cond ((= count 0) b)
	((even? count) (fib-iter a
				 b
				 (+ (* p p) (* q q))
				 (+ (* q p) (* q q) (* p q))
				 (/ count 2)))
	(else (fib-iter (+ (* b q)
			   (* a q)
			   (* a p))
			(+ (* b p)
			   (* a q))
			p
			q
			(- count 1)))))
			   
	 
