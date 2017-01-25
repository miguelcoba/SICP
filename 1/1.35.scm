x -> 1 + 1/x

; phi is
phi = (1 + sqrt(5))/2

; transforming the equation
x = 1 + 1/x
x*x = x*(1 + 1/x)
x^2 = x + 1
x^2 - x - 1 = 0
a = 1
b = -1
c = -1
x = (-b +/- sqrt(b^2 - 4 * a * c))/ (2 * a)
x = (-(-1) +/- sqrt((-1)^2 - 4 * (1) * (-1)))/ (2 * (1))
x = (1 +/- sqrt(1 + 4))/2
x = (1 +/- sqrt(5))/2
x1 = (1 + sqrt(5))/2
x2 = (1 - sqrt(5))/2

(define (golden-ratio)
  (fixed-point (lambda (x) (+ 1 (/ 1 x))) 1.0))

(golden-ratio)
