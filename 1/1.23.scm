(define (square x) (* x x))

(define (next x)
  (if (= x 2)
      3
      (+ x 2)))

(define (divides? a b)
  (= (remainder b a) 0))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
	((divides? test-divisor n) test-divisor)
	(else (find-divisor n (next test-divisor)))))

(define (smallest-divisor n)
  (find-divisor n 2))

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

100000000003 *** 17
100000000019 *** 29
100000000057 *** 15
 finished!
racket@> (search-for-primes 1000000000000 3)

1000000000039 *** 49
1000000000061 *** 59
1000000000063 *** 60
 finished!
racket@> (search-for-primes 10000000000000 3)

10000000000037 *** 156
10000000000051 *** 164
10000000000099 *** 150
 finished!
racket@> (search-for-primes 100000000000000 3)

100000000000031 *** 473
100000000000067 *** 465
100000000000097 *** 464
 finished!
racket@> (search-for-primes 1000000000000000 3)

1000000000000037 *** 1471
1000000000000091 *** 1479
1000000000000159 *** 1494
 finished!
racket@> (search-for-primes 10000000000000000 3)

10000000000000061 *** 4644
10000000000000069 *** 4766
10000000000000079 *** 4630
 finished!

; La razón de la velocidad de los dos algoritmos es aproximadamente 2:1 
; es decir, un poco menos del doble de velocidad