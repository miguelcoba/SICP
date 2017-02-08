;; a ^ 2 = b
;; a = sqrt(b)
(define (squarer a b)
  (define (process-new-value)
    (if (has-value? b)
        (if (< (get-value b) 0)
            (error "square less than 0 -- SQUARER" (get-value b))
            (set-value! a (sqrt (get-value b)) me))
	(if (has-value? a)
	    (set-value! b (square (get-value a)) me))))
  (define (process-forget-value)
    (forget-value! a me)b
    (forget-value! b me)
    (process-new-value))
  (define (me request)
    (cond ((eq? request 'I-have-a-value)  
           (process-new-value))
          ((eq? request 'I-lost-my-value) 
           (process-forget-value))
          (else 
           (error "Unknown request -- SQUARER" request))))
  (connect a me)
  (connect b me)
  me)


(define A (make-connector))
(define B (make-connector))
(squarer A B)

(set-value! A 5 'user)

(get-value B)
;Value: 25

(forget-value! A 'user)

(set-value! B 81 'user)

(get-value A)
;Value: 9

(forget-value! B 'user)

(has-value? A)
;Value: #f

(has-value? B)
;Value: #f
