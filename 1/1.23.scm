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

;(define (runtime) (current-milliseconds))

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
10009 *** 9.999999999990905e-3
10037 *** 0.
 finished!

(search-for-primes 100000 3)

100003 *** .01999999999998181
100019 *** .01999999999998181
100043 *** .01999999999998181
 finished!

(search-for-primes 1000000 3)

1000003 *** .16000000000008185
1000033 *** .14999999999997726
1000037 *** .15999999999996817
 finished!

(search-for-primes 10000000 3)

10000019 *** 1.5100000000001046
10000079 *** 1.509999999999991
10000103 *** 1.5499999999999545
 finished!

(search-for-primes 100000000 3)

100000007 *** 15.449999999999932
100000037 *** 15.569999999999936
100000039 *** 15.509999999999991
 finished!

; The rate between this and previous algorithm is 2:1
