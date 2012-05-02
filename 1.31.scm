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

; pi-product
n     1   2   3   4   5   6   7         1    2    3
pi    2 . 4 . 4 . 6 . 6 . 8 . 8...    (n+1)(n+2)(n+1)...
-- = ------------------------------ = ---------------------------- = 
4     3 . 3 . 5 . 5 . 7 . 7 . 9 ...   (n+2)(n+1)(n+2)...

(define (pi-product n)
  (define (term n)
    (if (even? n)
	(/ (+ n 2) (+ n 1))
	(/ (+ n 1) (+ n 2))))
  (* 4.0 (product term 1 inc n)))

; product genera un proceso iterativo.
; convertido a proceso recursivo
(define (product term a next b)
  (if (> a b)
      1
      (* (term a) (product term (next a) next b))))
