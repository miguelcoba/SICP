(define (unique-triples n)
  (flatmap (lambda (i)
	     (flatmap (lambda (j)
			(map (lambda (k) (list i j k))
			     (enumerate-interval 1 (- j 1))))
		      (enumerate-interval 1 (- i 1))))
	   (enumerate-interval 1 n)))

(define (triple-sum? triple s)
  (= (+ (car triple) (cadr triple) (caddr triple)) s))

(define (bounded-sum-triples n s)
  (filter (lambda (triple) (triple-sum? triple s))
	  (unique-triples n)))
