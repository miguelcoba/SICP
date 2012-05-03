(define (iterative-improve good-enough? improve)
  (lambda (guess)
    (if (good-enough? guess)
	guess
	((iterative-improve good-enough? improve) (improve guess)))))

; redefine sqrt en términos de iterative-improve
(define (square x) (* x x))

(define tolerance 0.00001)

(define (sqrt x)
  ((iterative-improve (lambda (guess) 
			(< (abs (- (square guess) x)) tolerance))
		      (lambda (guess) 
			(/ (+ guess
			      (/ x guess))
			   2)))
   2.0))

; test
(sqrt 2)
1.4142135623730951

(sqrt 4)
2

(sqrt 16)
4

; redefine fixed-point en términos de iterative-improve
(define tolerance 0.00001)

(define (fixed-point f first-guess)
  ((iterative-improve (lambda (guess)
			(let ((next (f guess)))
			  (< (abs (- guess next)) tolerance)))
		      f)
   first-guess))

; test
(fixed-point cos 1.0)
0.7390893414033927

(fixed-point (lambda (y) (+ (sin y) (cos y))) 1.0)
1.2587228743052672

