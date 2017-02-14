(define (stream-limit s tolerance)
  (let ((s0 (stream-ref s 0))
	(s1 (stream-ref s 1)))
    (if (< (abs (- s0 s1)) tolerance)
	s1
	(stream-limit (stream-cdr s) tolerance))))

(define (sqrt x tolerance)
  (stream-limit (sqrt-stream x) tolerance))

(sqrt 4 0.0001)
;Value: 2.000000000000002
