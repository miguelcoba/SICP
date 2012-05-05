(define (filtered-accumulate combiner null-value term a next b predicate)
  (define (iter a result)
    (cond ((> a b) result)
	  ((predicate a) (iter (next a) (combiner (term a) result)))
	  (else (iter (next a) result))))
  (iter a null-value))

(define (inc x) (+ x 1))

(define (square x) (* x x))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
	((divides? test-divisor n) test-divisor)
	(else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))

; a suma de cuadrados de los números primos entra a y b
(define (sum-squared-primes a b)
  (filtered-accumulate + 0 square a inc b prime?))

; b producto de todos los enteros positivos menores a n que son primos 
; relativos de n (all positive integers i < n such that GCD(i, n) = 1
(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

(define (product-positive-integers-less-than n)
  (define (filter x)
    (= (gcd x n) 1))
  (filtered-accumulate * 1 identity 1 inc (- n 1) filter))