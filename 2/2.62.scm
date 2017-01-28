(define (union-set set1 set2)
  (cond ((null? set1) set2)
	((null? set2) set1)
	((= (car set1) (car set2))
	 (cons (car set1) (union-set (cdr set1) (cdr set2))))
	((< (car set1) (car set2))
	 (cons (car set1) (union-set (cdr set1) set2)))
	(else (cons (car set2) (union-set set1 (cdr set2))))))

;; test

(union-set '() '())
;Value: ()

(union-set '(1) '())
;Value: (1)

(union-set '() '(1))
;Value: (1)

(union-set '(1) '(1))
;Value: (1)

(union-set '(1 2 3) '(4 5 6))
;Value: (1 2 3 4 5 6)

(union-set '(2 3) '(1 5 6))
;Value: (1 2 3 5 6)

(union-set '(7) '(1 5 6))
;Value: (1 5 6 7)



