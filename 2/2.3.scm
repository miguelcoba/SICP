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

(define (make-rectangle p1 p2) (cons p1 p2))

(define (p1-rectangle r) (car r))

(define (p2-rectangle r) (cdr r))

(define (base-rectangle r)
  (let ((p1 (p1-rectangle r))
	(p2 (p2-rectangle r)))
    (abs (- (x-point p2)
	    (x-point p1)))))

(define (height-rectangle r)
  (let ((p1 (p1-rectangle r))
	(p2 (p2-rectangle r)))
    (abs (- (y-point p2)
	    (y-point p1)))))

(define (rec-perimeter r)
  (* 2 (+ (base-rectangle r) (height-rectangle r))))

(define (rec-area r)
  (* (base-rectangle r) (height-rectangle r)))

(define rectangle (make-rectangle (make-point 1 3) (make-point 3 5)))

(rec-perimeter rectangle)

(rec-area rectangle)