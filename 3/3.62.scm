(define (div-series s1 s2)
  (let (first-term (stream-car s2))
    (if (zero? first-term)
	(error "divide by zero")
	(mul-series s1
		    (scale-stream
		     ;; invert-unit-series requires constant term to be 1, so we scale it to 1
		     (invert-unit-series (scale-stream s2 (/ 1 first-term)))
		     first-term)))));; the we undo the scale

(define tangent-series (div-series sine-series
				   cosine-series))
