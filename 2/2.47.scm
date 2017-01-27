(define (make-frame origin edge1 edge2)
  (list origin edge1 edge2))

(define (origin-frame frame)
  (car frame))

(define (edge1-frame frame)
  (cadr frame))

(define (edge2-frame frame)
  (caddr frame))

;; test
(define f (make-frame (make-vect 2 2) (make-vect 2 0) (make-vect 3 0)))
(origin-frame f)
(edge1-frame f)
(edge2-frame f)

(define (make-frame origin edge1 edge2)
  (cons origin (cons edge1 edge2)))

(define (origin-frame frame)
  (car frame))

(define (edge1-frame frame)
  (cadr frame))

(define (edge2-frame frame)
  (cddr frame))

;; test
(define f (make-frame (make-vect 2 2) (make-vect 2 0) (make-vect 3 0)))
(origin-frame f)
(edge1-frame f)
(edge2-frame f)
