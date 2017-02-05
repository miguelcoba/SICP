(define (ripple-carry-adder a b s c)
  (let ((ck (make-wire))
	(if (null? (cdr a))
	    (set-signal! ck 0)
	    (ripple-carry-adder (cdr a) (cdr b) (cdr s) ck))
	(full-adder (car a) (car b) ck (cdr s) c))))
