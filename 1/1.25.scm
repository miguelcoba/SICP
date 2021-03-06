(define (square x) (* x x))

(define (even? n)
  (= (remainder n 2) 0))

;(define (runtime) (current-milliseconds))

(define (fast-expt b n)
  (cond ((= n 0) 1)
	((even? n) (square (fast-expt b (/ n 2))))
	(else (* b (fast-expt b (- n 1))))))

(define (expmod base exp m)
  (remainder (fast-expt base exp) m))

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
	  ((even? from) (iter (+ from 1) how-many)); Si es par entonces no es primo y buscamos el siguiente impar
	  ((timed-prime-test from) (iter (+ from 2) (- how-many 1))) ; Si es primo, es uno menos por buscar, y probamos el siguiente impar (un primo nunca es par)
	  (else (iter (+ from 2) how-many)))) ; Buscamos el siguiente impar
  (iter from how-many))

; Output
(search-for-primes 1000 3)

1009 *** 0.
1013 *** 0.
1019 *** 1.0000000000005116e-2
 finished!

(search-for-primes 10000 3)

10007 *** .00999999999999801
10009 *** .00999999999999801
10037 *** .01999999999999602
 finished!


(search-for-primes 100000 3)

100003 *** 2.1300000000000026
100019 *** 2.1199999999999974
100043 *** 1.8900000000000006
 finished!

(search-for-primes 1000000 3)

; Produce los mismos resultados pero es muchisimo más lento
; probablemetne porque expmod original llama reminder muchas veces sobre valores pequeños
; y el de Alyssa sólo una vez con números enormes
