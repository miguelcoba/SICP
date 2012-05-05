(define (cons x y)
  (lambda (m) (m x y)))

(define (car z)
  (z (lambda (p q) p)))

(car (cons 1 3))

(define (cdr z)
  (z (lambda (p q) q)))

(cdr (cons 3 5))

; using substition model

(cdr (cons 3 5))
(cdr (lambda (m) (m 3 5)))
((lambda (m) (m 3 5)) (lambda (p q) q))
((lambda (p q) q) 3 5)
5

