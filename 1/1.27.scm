(define (square x) (* x x))

(define (even? n)
  (= (remainder n 2) 0))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
	((even? exp) (remainder (square (expmod base (/ exp 2) m)) m))
	(else (remainder (* base (expmod base (- exp 1) m)) m))))

(define (fermat-test n)
  (define  (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) true)
	((fermat-test n) (fast-prime? n (- times 1)))
	(else false)))

; Demonstrate that the Carmichael numbers listed fool the Fermat test

(fast-prime? 561 5)
#t
(fast-prime? 1105 5)
#t
(fast-prime? 1729 5)
#t
(fast-prime? 2465 5)
#t
(fast-prime? 2821 5)
#t
(fast-prime? 6601 5)
#t

; Test all a from 1 to n - 1
(define (fermat-test2 n)
  (define (test-it a n)
    (cond ((= a n) true)
	((= (expmod a n n) a) (test-it (+ a 1) n))
	(else false)))
  (test-it 1 n))

(fermat-test2 1105)
#t
(fermat-test2 1729)
#t
(fermat-test2 2465)
#t
(fermat-test2 2821)
#t
(fermat-test2 6601)
#t
