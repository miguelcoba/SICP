(define (adjoin-set x set)
  (cond ((null? set) (list x))
	((= x (car set)) set)
	((< x (car set)) (cons x set))
	(else (cons (car set) (adjoin-set x (cdr set))))))

;; test
(adjoin-set 1 '())
;Value 119: (1)

(adjoin-set 1 '(1))
;Value 120: (1)

(adjoin-set 1 '(2 3))
;Value 121: (1 2 3)

(adjoin-set 2 '(1 3))
;Value 122: (1 2 3)

(adjoin-set 3 '(1 2))
;Value 123: (1 2 3)

;; as the elements are ordered, the insertion can be at the first half or at the second half,
;; that means that in average half steps are needed to insert an element to the set
