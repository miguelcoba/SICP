(define fold-right accumulate)

(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest)
	result
	(iter (op result (car rest))
	      (cdr rest))))
  (iter initial sequence))

(fold-right / 1 (list 1 2 3))
;Value: 3/2

(fold-left / 1 (list 1 2 3))
;Value: 1/6

(fold-right list nil (list 1 2 3))
;Value 5: (1 (2 (3 ())))

(fold-left list nil (list 1 2 3))
;Value 6: (((() 1) 2) 3)



