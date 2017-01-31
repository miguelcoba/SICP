(define (make-monitored f)
  (let ((counter 0))
    (lambda (arg)
      (cond ((eq? arg 'how-many-calls?) counter)
	    ((eq? arg 'reset-count?) (set! counter 0))
	    (else (set! counter (+ counter 1))
		  (f arg))))))

(define s (make-monitored sqrt))

(s 100)

(s 'how-many-calls?)

(s 'reset-count?)

(s 'how-many-calls?)
   
