(define (product term a next b)
  (define (iter a result)
    (if (> a b)
	result
	(iter (next a) (* (term a) result))))
  (iter a 1))

; test
(define (identity x) x)

(define (inc n) (+ n 1))

(define (product-integers a b)
  (product identity a inc b))

; factorial
(define (factorial n)
  (product-integers 1 n))
