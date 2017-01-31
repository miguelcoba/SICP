;; a.
;; It won't find a method in the method table for '(complex complex) so it will try to find one
;; by first coercing the arguments.
;; As there is a coercing from complex to complex in the coercing table (we added the identity
;; mapping to it), it will wrongly will try again to call apply-generic with exactly the same
;; argument types: '(complex complex), resulting in an infinite recursion

;; b.
;; Louis is wrong. apply-generic already gives up if no method for arguments of same type are
;; found. coercing a type to the same type won't fix this.

;; c.
(define (apply-generic op . args)
  (let ((type-tags (map type-tag args)))
    (let ((proc (get op type-tags)))
      (if proc
	  (apply proc (map contents args))
	  (if (and (= (length args) 2)
		   (not (equal? (car type-tags)
			     (cadr type-tags))))
	      (let ((type1 (car type-tags))
		    (type2 (cadr type-tags))
		    (a1 (car args))
		    (a2 (cadr args)))
		(let ((t1->t2 (get-coercion type1 type2))
		      (t2->t1 (get-coercion type2 type1)))
		  (cond (t1->t2 (apply-generic op (t1->t2 a1) a2))
			(t2->t1 (apply-generic op a1 (t2->t1 a2)))
			(else
			 (error "No method for these types"
				(list op type-tags))))))
	      (error "No method for these types"
		     (list op type-tags)))))))

