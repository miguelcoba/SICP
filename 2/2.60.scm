(define (element-of-set? x set)
  (cond ((null? set) false)
	((equal? x (car set)) true)
	(else (element-of-set? x (cdr set)))))

(define (adjoin-set x set)
  (cons x set))

(define (intersection-set set1 set2)
  (cond ((or (null? set1) (null? set2)) '())
	((element-of-set? (car set1) set2)
	 (cons (car set1)
	       (intersection-set (cdr set1) set2)))
	(else (intersection-set (cdr set1) set2))))

(define (union-set set1 set2)
  (append set1 set2))

;; test
(union-set (list 1 2 2) (list 3 4))
;Value 96: (1 2 2 3 4)

(union-set (list 1 2 2) (list 2 4))
;Value 97: (1 2 2 2 4)

(union-set (list 1 2 2) '())
;Value 98: (1 2 2)

(union-set '() '())
;Value: ()

(intersection-set (list 1 2 2) (list 2 4 4))
;Value 102: (2 2)

(intersection-set (list 2 2 4 4) (list 2 2 4 4))
;Value 102: (2 2 4 4)

(intersection-set (list 1 2) (list 3 4))
;Value: ()

;; the efficiency of element-of-set doesn't change
;; the efficiency of adjoin-set is now O(1) but the space efficiency is worst (always adds elements to set)
;; intersection-set efficiency doesn't change
;; union-set efficiency is better, now is O(n) as adds the n values of set1 to set2
