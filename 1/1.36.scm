(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (display "guess: ")
    (display guess)
    (newline)
    (let ((next (f guess)))
      (if (close-enough? guess next)
	  next
	  (try next))))
  (try first-guess))

(define (average a b)
  (/ (+ a b) 2))

; without average damping
(define (x-to-the-x)
  (fixed-point (lambda (x) (/ (log 1000) (log x))) 2.0))

; converges in 64 steps
(x-to-the-x)

; with average damping
(define (x-to-the-x-damping)
  (fixed-point (lambda (x) (average x (/ (log 1000) (log x)))) 2.0))

; converges in 9 steps
(x-to-the-x-damping)
