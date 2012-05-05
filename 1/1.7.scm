; Esta versión compara la diferencia en guess entre esta iteración y la
; iteración
(define (good-enough? guess x)
  (< (abs (- (improve guess x) guess))
     (abs (* guess 0.001))))