(define (=zero? x) (apply-generic '=zero? x))

(define (install-zero-scheme-number-package)
  (put '=zero? 'scheme-number
       (lambda (x) (= x 0)))
  'done)

(define (install-zero-rational-package)
  (define (=zero? x)
    (= (number x) 0))
  (put '=zero? 'rational =zero?)
  'done)

(define (install-zero-complex-package)
  (define (zero? z)
    (or (= (real-part z) 0) (= (imag-part z) 0)))
  (put '=zero? 'complex =zero?)
  'done)
