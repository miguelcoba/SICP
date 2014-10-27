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

; (define (runtime) (current-milliseconds))

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
10009 *** 0.
10037 *** 0.
 finished!

(search-for-primes 100000 3)

100003 *** 2.9999999999972715e-2
100019 *** 2.9999999999972715e-2
100043 *** 3.0000000000086402e-2
 finished!

(search-for-primes 1000000 3)

1000003 *** .31999999999993634
1000033 *** .3100000000000591
1000037 *** .30999999999994543
 finished!

(search-for-primes 10000000 3)

10000019 *** 3.130000000000109
10000079 *** 3.0599999999999454
10000103 *** 3.009999999999991
 finished!

(search-for-primes 100000000 3)

100000007 *** 30.31000000000006
100000037 *** 30.409999999999968
100000039 *** 30.100000000000023
 finished!

; Do your timing data bear this out? No. It takes 10 times for each order of magnitude increment

