(define (square x)
  (* x x))

(define (sum-square a b)
  (+ (square a) (square b)))

(define (p a b c) 
  (if (> a b) 
      (if (> b c)
	  (sum-square a b) 
	  (sum-square a c)) 
      (if (> a c) 
	  (sum-square b a) 
	  (sum-square b c))))

