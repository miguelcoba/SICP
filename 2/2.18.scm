; iterative
(define (reverse original-list)
  (define (iter l result)
    (if (null? l)
	result
	(iter (cdr l) (cons (car l) result))))
  (iter original-list (list )))); could also use '() instead of (list )

; recursive
(define (reverse l)
  (if (null? l)
      (list )
      (append (reverse (cdr l)) (list (car l)))))
