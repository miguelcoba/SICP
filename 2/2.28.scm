(define (fringe x)
  (cond ((null? x) '())
	((not (pair? x)) (list x))
	(else (append (fringe (car x)) (fringe (cdr x))))))
