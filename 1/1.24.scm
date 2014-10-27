(define (square x) (* x x))

(define (even? n)
  (= (remainder n 2) 0))

;(define (runtime) (current-milliseconds))

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

(define (timed-prime-test n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (fast-prime? n 3) ;; probamos si es primo 3 veces
      (report-prime n (- (runtime) start-time))
      false))

(define (report-prime n elapsed-time)
  (newline)
  (display n)
  (display " *** ")
  (display elapsed-time))

(define (search-for-primes from how-many)
  (define (iter from how-many)
    (cond ((= how-many 0) (display "\n finished!\n"))
	  ((even? from) (iter (+ from 1) how-many)); If it is even, then is not prime and we search for the nex odd number
	  ((timed-prime-test from) (iter (+ from 2) (- how-many 1))) ; If it is prime, it is one less to find and we try the next odd number (a prime is never even)
	  (else (iter (+ from 2) how-many)))) ; Find next odd number
  (iter from how-many))

; Output
(search-for-primes 1000 3)

1009 *** 0.
1013 *** 0.
1019 *** 0.
 finished!

(search-for-primes 10000 3)

10007 *** 0.
10009 *** 0.
10037 *** 0.
 finished!

(search-for-primes 100000 3)

100003 *** 0.
100019 *** 0.
100043 *** 0.
 finished!

(search-for-primes 1000000 3)

1000003 *** 0.
1000033 *** 0.
1000037 *** 0.
 finished!

(search-for-primes 10000000 3)

10000019 *** 0.
10000079 *** 0.
10000103 *** 0.
 finished!

(search-for-primes 1000000000 3)

1000000007 *** 0.
1000000009 *** 0.
1000000021 *** 0.
 finished!

; Time is constant for each order of magnitude
; so order of growth is O(log n)
