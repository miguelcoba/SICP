;    a           5        8
;    b          3 5      3 5
;difference     2 0      5 3
; result          *      *
(define (sub-interval a b)
  (make-interval (- (lower-bound a) (upper-bound b))
		 (- (upper-bound a) (lower-bound b))))
