(define (square x) (* x x))

(define (square-list items)
  (define (iter things answer)
    (if (null? things)
	answer
	(iter (cdr things)
	      (cons (square (car things))
		    answer))))
  (iter items '()))

; evaluating
(square-list (list 1 2 3 4))
(16 9 4 1)

; Produces the answer in reverse order because it recurses over
; the cdr of the items on each iteration until the list is empty. In
; each iteration conses the square of each value to the list of
; previous computed values, stacking them in reverse order
(square-list (list 1 2 3 4))
(iter '(1 2 3 4) '())
(iter '(2 3 4) (cons (square 1) '())
(iter '(2 3 4) '(1))
(iter '(3 4) (cons (square 2) '(1)))
(iter '(3 4) '(4 1))
(iter '(4) (cons (square 3) '(4 1)))
(iter '(4) '(9 4 1))
(iter '() (cons (square 4) '(9 4 1)))
(iter '() '(16 9 4 1))
'(16 9 4 1)

(define (square-list items)
  (define (iter things answer)
    (if (null? things)
	answer
	(iter (cdr things)
	      (cons answer
		    (square (car things))))))
  (iter items '()))

; evaluating
(square-list (list 1 2 3 4))
'((((() . 1) . 4) . 9) . 16)

; This doesn't work because now it conses the answer (a list) of each iteration
; with the next value, instead of a value with a list.
