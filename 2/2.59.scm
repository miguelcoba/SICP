(define (union-set set1 set2)
  (cond ((null? set1) set2)
	((null? set2) set1)
	((element-of-set? (car set1) set2)
	 (union-set (cdr set1) set2))
	(else (cons (car set1) (union-set (cdr set1) set2)))))

;; test
(union-set (list 1 2) (list 3 4))
;Value 96: (1 2 3 4)

(union-set (list 1 2) (list 2 4))
;Value 97: (1 2 4)

(union-set (list 1 2) '())
;Value 98: (1 2)

(union-set '() '())
;Value: ()
