(define (cont-frac n d k)
  (define (term n d k result)
    (if (= k 0)
	result
	(term n d (- k 1) (/ (n k)(+ (d k) result)))))
  (term n d k 0))

(define (e-aprox k)
  (define (n i) 1.0)
  (define (d i)
    (if (= (remainder i 3) 2)
	(* (/ (+ i 1) 3) 2)
	1))
  (+ 2 (cont-frac n d k)))

(e-aprox 8)
2.718279569892473


