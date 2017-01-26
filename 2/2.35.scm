;; recursively count-leaves
;; accumulates a 1 when finds a leaf
(define (count-leaves t)
  (accumulate + 0 (map
		   (lambda (tree)
		     (if (pair? tree) (count-leaves tree) 1))
		   t)))
