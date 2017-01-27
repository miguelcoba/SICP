(define (make-segment start end)
  (cons start end))

(define (start-segment segment)
  (car segment))

(define (end-segment segment)
  (cdr segment))

;; usage
(define s (make-segment (make-vect 0.3 0.4) (make-vect 0.5 0.7)))
(start-segment s)
(end-segment s)
