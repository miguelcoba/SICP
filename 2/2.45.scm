(define (split h1 h2)
  (define (split-func painter n)
    (if (= n 0)
	painter
	(let ((smaller (split-func painter (- n 1))))
	  (h1 painter (h2 smaller smaller)))))
  split-func)

(define right-split (split beside below))
(define up-split (split below beside))
