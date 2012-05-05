(define (square x) (* x x))

(define (f g)
  (g 2))

(f square)

(f (lambda (z) (* z (+ z 1))))

(f f)

; Error porque se pasará un lambda (lambda (x) (x 2)) la cual se aplicará al
; argumento 2 resultando en ((lambda (x) (x 2)) 2) -> (2 2).
; 2 no es un procedimiento sino un valor y no puede ser aplicado al argumento 2

