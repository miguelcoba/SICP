(define (flip-horiz painter)
  (transform-painter painter
		     (make-vect 1.0 0.0) ; new origin
		     (make-vect 0.0 0.0) ; new end of edge1
		     (make-vect 1.0 0.0))) ; new end of edge2

;; doing double rotation (double transform)
(define (rotate180 painter)
  (rotate90 (rotate90 painter)))

;; single transform
(define (rotate180 painter)
  (transform-painter painter
                     (make-vect 1.0 1.0)
                     (make-vect 0.0 1.0)
                     (make-vect 1.0 0.0)))

;; doing triple rotation (double transform)
(define (rotate270 painter)
  (rotate90 (rotate180 painter)))

;; single transform
(define (rotate270 painter)
  (transform-painter painter
                     (make-vect 0.0 1.0)
                     (make-vect 0.0 0.0)
                     (make-vect 1.0 1.0)))


