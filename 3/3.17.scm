(define (memq item x)
  (cond ((null? x) false)
	((eq? item (car x)) x)
	(else (memq item (cdr x)))))

(define (count-pairs x)
  (if (not (pair? x))
      0
      (+ (count-pairs (car x))
         (count-pairs (cdr x))
         1)))

(define (correct-count-pairs x)
  (let ((seen '()))
    (define (correct-count x) 
      (cond ((not (pair? x)) 0)
	    ((memq x seen) 0)
	    (else
	     (set! seen (cons x seen))
	     (+ (correct-count (car x))
		(correct-count (cdr x))
		1))))
    (correct-count x)))

(define second (cons 'a 'b))
(define third (cons 'a 'b)) 
(define first (cons second third)) 
(set-car! third second)

(count-pairs first)
;Value: 4

(correct-count-pairs first)
;Value: 3
