;;   (a0 + a1x + a2xˆ2) * (b0 + b1x + b2x^2) =
;;   a0b0 + a0 * (b1x+ b2x^2) + (a1x + a2x^2)*(b0 + b1x + b2x^2)
(define (mul-series s1 s2)
  (cons-stream (* (stream-car s1)
		  (stream-car s2))
	       (add-streams (scale-stream (stream-cdr s2) (stream-car s1))
			    (mul-series (stream-cdr s1) s2))))

;; sin^2 x + cos^2 x = 1

(display-stream (add-streams (mul-series sine-series sine-series)
			     (mul-series cosine-series cosine-series)))

1
0
0
0
0
0





