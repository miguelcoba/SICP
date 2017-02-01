;; Predicate: (x - x0)^2 + (y - y0)^2 <= 1^2
;;            x^2 + y^2 <= 1
(define (P x y)
  (<= (+ (square x) (square y)) 1))

(define (estimate-integral P x1 x2 y1 y2 trials)
  (define (random-in-range low high)
    (let ((range (- high low)))
      (+ low (random range))))
  ;; area A of unit circle is fraction * area of rectangle
  ;; A = pi * r^2 with r = 1, so pi = A = fraction * area of rectangle
  (* (monte-carlo trials
		  (lambda ()
		    (P (random-in-range x1 x2)
		       (random-in-range y1 y2)))) ;; fraction
     (* (- x2 x1) (- y2 y1)))) ;; area of rectangle


(estimate-integral P -1.0 1.0 -1.0 1.0 10000)
;Value: 3.1468
