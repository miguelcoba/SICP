(define (deriv exp var)
  (cond ((number? exp) 0)
	((variable? exp)
	 (if (same-variable? exp var) 1 0))
	((sum? exp)
	 (make-sum (deriv (addend exp) var)
		   (deriv (augend exp) var)))
	((product? exp)
	 (make-sum
	  (make-product (multiplier exp)
			(deriv (multiplicand exp) var))
	  (make-product (multiplicand exp)
			(deriv (multiplier exp) var))))
	((exponentiation? exp)
	 (make-product (exponent exp)
		       (make-product (make-exponentiation (base exp)
							  (- (exponent exp) 1))
				     (deriv (base exp) var))))
	(else
	 (error "unknown expression type - - DERIV" exp))))

(define (make-exponentiation base exponent)
  (cond ((=number? exponent 0) 1)
	((=number? exponent 1) base)
	(else (list '** base exponent))))

(define (exponentiation? x)
  (and (pair? x) (eq? (car x) '**)))

(define (base x) (cadr x))

(define (exponent x) (caddr x))

;; test
(deriv '(** x 2) 'x)
;Value 83: (* 2 x)

(deriv '(* 3 (** x 2)) 'x)
;Value 84: (* 3 (* 2 x))
