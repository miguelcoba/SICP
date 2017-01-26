; Using map and discarding the list created
(define (for-each proc items)
  (map proc items))

(for-each (lambda (x) (newline) (display x))
	  (list 57 321 88))

; recursive
(define (for-each proc items)
  (cond ((null? items) #t)
	(else (proc (car items))
	      (for-each proc (cdr items)))))


