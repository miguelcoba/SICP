(define (has-cycle? x)
  (let ((seen '()))
    (define (seen? x) 
      (cond ((not (pair? x)) false)
	    ((memq x seen) true)
	    (else
	     (set! seen (cons x seen))
	     (seen? (cdr x)))))
    (seen? x)))

(has-cycle? '(a b c))
;Value: #f

(has-cycle? (make-cycle '(a b c)))
;Value: #t
