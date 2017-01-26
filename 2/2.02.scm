(define (average x y) (/ (+ x y) 2))

(define (make-point x y) (cons x y))

(define (x-point p) (car p))

(define (y-point p) (cdr p))

(define (make-segment p1 p2) (cons p1 p2))

(define (start-segment s) (car s))

(define (end-segment s) (cdr s))

(define (midpoint-segment s)
  (let ((p1 (start-segment s))
	(p2 (end-segment s)))
    (make-point (average (x-point p1) (x-point p2))
	      (average (y-point p1) (y-point p2)))))

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

;; test
(define p1 (make-point 1 3))

(define p2 (make-point 3 5))

(define s (make-segment p1 p2))

(define m (midpoint-segment s))

(print-point m)
