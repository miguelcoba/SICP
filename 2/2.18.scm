; iterative
(define (reverse list)
  (define (iter l result)
    (if (null? l)
	result
	(iter (cdr l) (cons (car l) result))))
  (iter list '()))

; recursive
(define (reverse l)
  (if (null? l)
      '()
      (append (reverse (cdr l)) (list (car l)))))
