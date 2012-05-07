(define (div-interval x y)
  (if (and (negative? (lower-bound y))
	   (positive? (upper-bound y)))
      (error "divisor interval span is zero")
      (mul-interval x
		    (make-interval (/ 1.0 (upper-bound y))
				   (/ 1.0 (lower-bound y))))))