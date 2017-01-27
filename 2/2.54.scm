(equal? '(this is a list) '(this is a list))

(equal? '(this is a list) '(this (is a) list))

(define (equal? a b)
  (cond ((and (not (pair? a)) (not (pair? b))) ; both are symbols
	 (eq? a b)) ; compare symbols
	((and (pair? a) (pair? b)) ; both are lists
	 (and (equal? (car a) (car b))
	      (equal? (cdr a) (cdr b)))) ; compare head and rest
	(else false)))

;; test
(equal? '(this is a list) '(this is a list))
;Value: #t

(equal? '(this is a list) '(this (is a) list))
;Value: #f
