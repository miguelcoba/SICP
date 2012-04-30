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

(define (runtime) (current-milliseconds))

(define (timed-prime-test n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n) 
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
racket@> (search-for-primes 100000000000 3)

100000000003 *** 29
100000000019 *** 26
100000000057 *** 25
 finished!
racket@> (search-for-primes 1000000000000 3)

1000000000039 *** 84
1000000000061 *** 76
1000000000063 *** 82
 finished!
racket@> (search-for-primes 10000000000000 3)

10000000000037 *** 237
10000000000051 *** 260
10000000000099 *** 260
 finished!
racket@> (search-for-primes 100000000000000 3)

100000000000031 *** 753
100000000000067 *** 750
100000000000097 *** 750
 finished!
racket@> (search-for-primes 1000000000000000 3)

1000000000000037 *** 2359
1000000000000091 *** 2359
1000000000000159 *** 2612
 finished!
racket@> (search-for-primes 10000000000000000 3)

10000000000000061 *** 7504
10000000000000069 *** 8343
10000000000000079 *** 7509
 finished!

; Los tiempos crecen sqrt(10) ~ 3 veces en cada orden de magnitud
; Los programas se ejecutan en tiempo proporcional al número de pasos requeridos