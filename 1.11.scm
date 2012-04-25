; recursivo
(define (f n)
  (cond ((< n 3) n)
	(else (+ (f (- n 1))
		 (* 2 (f (- n 2)))
		 (* 3 (f (- n 3)))))))

; iterativo
(define (foo n)
  (if (< n 3)
      n
      (foo-iter 2 1 0 n)))
(define (foo-iter a b c n)
  (if (< n 3)
      a
      (foo-iter (+ a (* 2 b) (* 3 c)) a b (- n 1))))