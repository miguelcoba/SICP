(define (deriv exp var)
   (cond ((number? exp) 0)
         ((variable? exp) (if (same-variable? exp var) 1 0))
         (else ((get 'deriv (operator exp)) (operands exp)
                                            var))))
(define (operator exp) (car exp))
(define (operands exp) (cdr exp))

;; a. The deriv operation can be installed in the table of operations for any operand. We can't
;; add number? and variable? to the table because of the meaning of those is not configurable
;; by the package creators.

;; b.

(define (install-deriv-package)
  ;; internal procedures
  (define (make-sum a1 a2) (list '+ a1 a2))

  (define (make-product a1 a2) (list '* a1 a2))

  (define (addend s) (car s))

  (define (augend s) (cadr s))

  (define (multiplier s) (car s))

  (define (multiplicand s) (cadr s))

  (define (deriv-sum exp var)
    (make-sum (deriv (addend exp) var)
	      (deriv (augend exp) var)))

  (define (deriv-product exp var)
     (make-sum
      (make-product (multiplier exp)
		    (deriv (multiplicand exp) var))
      (make-product (deriv (multiplier exp) var)
		    (multiplicand exp))))
  ;; interface to the rest of the system
  (put 'deriv '+ deriv-sum)
  (put 'deriv '+ deriv-sum))

(define (install-deriv-package)
  ;; internal procedures
  (define (make-sum a1 a2) (list '+ a1 a2))

  (define (make-product a1 a2) (list '* a1 a2))

  (define (addend s) (car s))

  (define (augend s) (cadr s))

  (define (multiplier s) (car s))

  (define (multiplicand s) (cadr s))

  (define (deriv-sum exp var)
    (make-sum (deriv (addend exp) var)
	      (deriv (augend exp) var)))

  (define (deriv-product exp var)
     (make-sum
      (make-product (multiplier exp)
		    (deriv (multiplicand exp) var))
      (make-product (deriv (multiplier exp) var)
		    (multiplicand exp))))
  ;; interface to the rest of the system
  (put 'deriv '+ deriv-sum)
  (put 'deriv '+ deriv-sum))

;; c

(define (install-deriv-exponent-package)
  ;; internal procedures
  (define (make-exponentiation base exponent)
    (cond ((=number? exponent 0) 1)
	  ((=number? exponent 1) base)
	  (else (list '** base exponent))))

  (define (base x) (cadr x))

  (define (exponent x) (caddr x))

  (define (deriv-exponent exp var)
    (make-product (exponent exp)
		  (make-product (make-exponentiation (base exp)
						     (- (exponent exp) 1))
				(deriv (base exp) var))))

  ;; interface to the rest of the system
  (put 'deriv '** deriv-exponent))

;; d. None if the get internally knows that now the type ys the first argument and the method
;; is the second and reads them from the correct positions in the table. In this case, put works
;; correctly.
;; if get is a primitive and the first argument reads from the method column, then it will fail
;; and then the put needs to also be changed to write the values in the order get expects them
