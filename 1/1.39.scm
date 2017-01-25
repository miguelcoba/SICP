(define (cont-frac n d k)
  (define (term n d k result)
    (if (= k 0)
	result
	(term n d (- k 1) (/ (n k)(+ (d k) result)))))
  (term n d k 0))

; formula
i  n  formula
-  -  -------
1  1   2*n-1 
2  3   2*n-1
3  5   2*n-1
4  7   2*n-1
5  9   2*n-1

(define (tan-cf x k)
  (define (n i) (if (= i 1) x (- (* x x))))
  (define (d i) (- (* 2 i) 1))
  (cont-frac n d k))

; test
tan 1 = 1.557407725

(tan-cf 1.0 7)
1.5574077246432194
