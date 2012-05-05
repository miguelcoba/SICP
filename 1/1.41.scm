(define (double f)
  (lambda (x)
    (f (f x))))

(define (inc x) (+ x 1))

; test
((double inc) 1)
3

; aplica 16 veces el procedimiento inc por tanto incrementa 16 a 5 resultando
; en 21
(((double (double double)) inc) 5)
