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
      (report-prime n (- (runtime) start-time))))

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
;Unspecified return value

(search-for-primes 10000 3)

10007 *** 0.
10009 *** 0.
10037 *** 0.
 finished!
;Unspecified return value

(search-for-primes 100000 3)

100003 *** 0.
100019 *** 0.
100043 *** 0.
 finished!
;Unspecified return value

(search-for-primes 1000000 3)

1000003 *** 0.
1000033 *** 0.
1000037 *** 0.
 finished!
;Unspecified return value

(search-for-primes 10000000 3)

10000019 *** 0.
10000079 *** 0.
10000103 *** 1.0000000000019327e-2
 finished!
;Unspecified return value

(search-for-primes 100000000 3)

100000007 *** 9.999999999990905e-3
100000037 *** 2.0000000000010232e-2
100000039 *** 9.999999999990905e-3
 finished!
;Unspecified return value

(search-for-primes 1000000000 3)

1000000007 *** .03999999999999204
1000000009 *** 4.0000000000020464e-2
1000000021 *** .04999999999998295
 finished!
;Unspecified return value

(search-for-primes 10000000000 3)

10000000019 *** .12000000000000455
10000000033 *** .12999999999999545
10000000061 *** .12000000000000455
 finished!
;Unspecified return value

(search-for-primes 100000000000 3)

100000000003 *** .38999999999998636
100000000019 *** .39999999999997726
100000000057 *** .38999999999998636
 finished!
;Unspecified return value

(search-for-primes 1000000000000 3)

1000000000039 *** 1.2199999999999989
1000000000061 *** 1.2300000000000182
1000000000063 *** 1.25
 finished!
;Unspecified return value

(search-for-primes 10000000000000 3)

10000000000037 *** 3.930000000000007
10000000000051 *** 3.8899999999999864
10000000000099 *** 3.8799999999999955
 finished!
;Unspecified return value

(search-for-primes 100000000000000 3)

100000000000031 *** 12.320000000000022
100000000000067 *** 12.349999999999966
100000000000097 *** 12.389999999999986
 finished!
;Unspecified return value

(search-for-primes 1000000000000000 3)

1000000000000037 *** 40.06999999999999
1000000000000091 *** 39.77000000000001
1000000000000159 *** 39.329999999999984
 finished!
;Unspecified return value

; Do your timing data bear this out? yes, each order of magnitude increase (x10) takes aprox sqrt(10)=3.16 times more

