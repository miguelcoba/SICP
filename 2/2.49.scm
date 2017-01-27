;; a
(define (outline->painter)
  (segments->painter (list (make-segment (make-vect 0 0) (make-vect 1 0))
			   (make-segment (make-vect 1 0) (make-vect 1 1))
			   (make-segment (make-vect 1 1) (make-vect 0 1))
			   (make-segment (make-vect 0 1) (make-vect 0 0)))))

;; b
(define (x->painter)
  (segments->painter (list (make-segment (make-vect 0 0) (make-vect 1 1))
			   (make-segment (make-vect 1 0) (make-vect 0 1)))))

;; c
(define (diamond->painter)
  (segments->painter (list (make-segment (make-vect 0.5 0) (make-vect 1 0.5))
			   (make-segment (make-vect 1 0.5) (make-vect 0.5 1))
			   (make-segment (make-vect 0.5 1) (make-vect 0 0.5))
			   (make-segment (make-vect 0 0.5) (make-vect 0.5 0)))))

;; d
;; same idea but with alot more segments
