(define (cons x y)
  (lambda (m) (m x y)))

(define (car z)
  (z (lambda (p q) p)))

(car (cons 1 3))

(define (cdr z)
  (z (lambda (p q) q)))

(cdr (cons 3 5))

; using substitution model

(cdr (cons x y))
(cdr (lambda (m) (m x y)))
((lambda (m) (m x y)) (lambda (p q) q))
((lambda (p q) q) x y)
y

