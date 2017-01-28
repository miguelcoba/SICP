(define (union-set-list set1 set2)
  (cond ((null? set1) set2)
	((null? set2) set1)
	((= (car set1) (car set2))
	 (cons (car set1) (union-set-list (cdr set1) (cdr set2))))
	((< (car set1) (car set2))
	 (cons (car set1) (union-set-list (cdr set1) set2)))
	(else (cons (car set2) (union-set-list set1 (cdr set2))))))

(define (union-set tree1 tree2)
  (list->tree (union-set-list (tree->list-2 tree1)
			      (tree->list-2 tree2))))

(define (intersection-set-list set1 set2)
  (if (or (null? set1) (null? set2))
      '()    
      (let ((x1 (car set1)) (x2 (car set2)))
        (cond ((= x1 x2)
               (cons x1
                     (intersection-set-list (cdr set1)
					    (cdr set2))))
              ((< x1 x2)
               (intersection-set-list (cdr set1) set2))
              ((< x2 x1)
               (intersection-set-list set1 (cdr set2)))))))


(define (intersection-set tree1 tree2)
  (list->tree (intersection-set-list (tree->list-2 tree1)
				     (tree->list-2 tree2))))

;; test
(tree->list-2 (union-set (list->tree '(1 2 3 4 5 8))
			 (list->tree '(1 2 4 9 10))))
;Value: (1 2 3 4 5 8 9 10)

(tree->list-2 (intersection-set (list->tree '(1 2 3 4 5 8))
				(list->tree '(1 2 4 9 10))))
;Value: (1 2 4)

