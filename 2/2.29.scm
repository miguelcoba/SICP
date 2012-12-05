(define (make-mobile left right)
  (list left right))

(define (make-branch length structure)
  (list length structure))

; a.
(define (left-branch mobile)
  (car mobile))

(define (right-branch mobile)
  (car (cdr mobile)))

(define (branch-length branch)
  (car branch))

(define (branch-structure branch)
  (car (cdr branch)))

; b.
(define (is-mobile? x)
  (pair? x))

(define (branch-weight branch)
  (let ((structure (branch-structure branch)))
    (cond ((is-mobile? structure)
	   (+ (branch-weight (left-branch structure))
	      (branch-weight (right-branch structure))))
	  (else structure))))

(define (total-weight mobile)
  (+ (branch-weight (left-branch mobile))
     (branch-weight (right-branch mobile))))

;; example
(define m1 (make-mobile (make-branch 3 10) (make-branch 5 6)))
(define m2 (make-mobile (make-branch 4 m1) (make-branch 8 8)))
(total-weight m2)

; c.
(define (branch-balanced? branch)
  (let ((structure (branch-structure branch)))
    (if (is-mobile? structure) 
	(mobile-balanced? structure)
	true)))

(define (mobile-balanced? mobile)
  (define (branch-torque branch)
    (* (branch-weight branch)
       (branch-length branch)))
  (let ((left (left-branch mobile))
	(right (right-branch mobile)))
    (and (= (branch-torque left)
	    (branch-torque right))
	 (branch-balanced? left)
	 (branch-balanced? right))))

(mobile-balanced? m2)

; d.
; Only branch-structure and right-branch need to be modified
(define (right-branch mobile)
  (cdr mobile))

(define (branch-structure branch)
  (cdr branch))

