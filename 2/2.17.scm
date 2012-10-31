; using previously defined procedures
(define (list-ref items n)
  (if (= n 0)
      (car items)
      (list-ref (cdr items) (- n 1))))

(define (length items)
  (if (null? items)
      0
      (+ 1 (length (cdr items)))))

(define (last-pair l)
  (list (list-ref l (- (length l) 1))))


; Using a single procedure
(define (last-pair l)
  (if (null? (cdr l))
      (list (car l))
      (last-pair (cdr l))))
