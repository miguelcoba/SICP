; accumulate 
; iterative process
(define (accumulate combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
	result
	(iter (next a) (combiner (term a) result))))
  (iter a null-value))

; sum as a call to accumulate
(define (sum term a next b)
  (accumulate + 0 term a next b))

; product as a call to accumulate
(define (product term a next b)
  (accumulate * 1 term a next b))

(define (identity x) x)

(define (inc x) (+ x 1))

; sum-integers
(define (sum-integers a b)
  (sum identity a inc b))

; product-integers
(define (product-integers a b)
  (product identity a inc b))

; test
(sum-integers 1 10)
55
(product-integers 1 10)
3628800

; accumulate 
; recursive process
(define (accumulate combiner null-value term a next b)
    (if (> a b)
	null-value
	(combiner (term a) (accumulate combiner null-value term (next a) next b))))
