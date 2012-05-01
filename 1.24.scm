(define (square x) (* x x))

(define (even? n)
  (= (remainder n 2) 0))

(define (runtime) (current-milliseconds))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
	((even? exp) (remainder (square (expmod base (/ exp 2) m)) m))
	(else (remainder (* base (expmod base (- exp 1) m)) m))))

(define (fermat-test n)
  (define  (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- (min n 4294967087) 1)))))

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
	  ((even? from) (iter (+ from 1) how-many)); Si es par entonces no es primo y buscamos el siguiente impar
	  ((timed-prime-test from) (iter (+ from 2) (- how-many 1))) ; Si es primo, es uno menos por buscar, y probamos el siguiente impar (un primo nunca es par)
	  (else (iter (+ from 2) how-many)))) ; Buscamos el siguiente impar
  (iter from how-many))

; Resultados para 1e11 hasta 1e16
racket@> (search-for-primes 1000000000000000000000 3)

1000000000000000000117 *** 8
1000000000000000000193 *** 8
1000000000000000000213 *** 11
 finished!
racket@> (search-for-primes 1000000000000000000000000 3)

1000000000000000000000007 *** 9
1000000000000000000000049 *** 9
1000000000000000000000121 *** 9
 finished!
racket@> (search-for-primes 1000000000000000000000000000 3)

1000000000000000000000000103 *** 10
1000000000000000000000000279 *** 10
1000000000000000000000000283 *** 14
 finished!
racket@> (search-for-primes 1000000000000000000000000000000 3)

1000000000000000000000000000057 *** 11
1000000000000000000000000000099 *** 14
1000000000000000000000000000211 *** 14
 finished!
racket@> (search-for-primes 1000000000000000000000000000000000 3)

1000000000000000000000000000000061 *** 16
1000000000000000000000000000000249 *** 12
1000000000000000000000000000000283 *** 16
 finished!
racket@> (search-for-primes 1000000000000000000000000000000000000000000 3)

1000000000000000000000000000000000000000063 *** 19
1000000000000000000000000000000000000000169 *** 16
1000000000000000000000000000000000000000361 *** 19
 finished!
racket@> (search-for-primes 1000000000000000000000000000000000000000000000 3)

1000000000000000000000000000000000000000000009 *** 20
1000000000000000000000000000000000000000000121 *** 20
1000000000000000000000000000000000000000000301 *** 21
 finished!
racket@> (search-for-primes 1000000000000000000000000000000000000000000000000 3)

1000000000000000000000000000000000000000000000193 *** 18
1000000000000000000000000000000000000000000000217 *** 21
1000000000000000000000000000000000000000000000451 *** 21
 finished!

; Por cada orden de magnitud, aumenta un tiempo constante
; En nuestro caso es un millisegundo por cada 3 órdenes de magnitud
; por tanto el crecimiento es O(log n)