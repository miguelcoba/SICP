(define (equ? x y) (apply-generic 'equ? x y))

(define (install-equ-scheme-number-package)
  (put 'equ? '(scheme-number scheme-number) =)
  'done)

(define (install-equ-rational-package)
  (define (equ? x y)
    (= (* (number x) (denom y)) (* (number y) (denom x))))
  (put 'equ? '(rational rational) equ?)
  'done)

(define (install-equ-complex-package)
  (define (equ? x y)
    (and (= (real-part x) (real-part y)) (= (imag-par x) (imag-part y))))
  (put 'equ? '(complex complex) equ?)
  'done)
