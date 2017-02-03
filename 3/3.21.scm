(define q1 (make-queue))

(insert-queue! q1 'a)
;Value: ((a) a)

(insert-queue! q1 'b)
;Value: ((a b) b)

(delete-queue! q1)
;Value: ((b) b)

(delete-queue! q1)
;Value: (() b)

;; The list printer is just printing the queue that is a pair and so it shows it.
;; the problem is that the last delete-queue! moved the front-ptr to the cdr of the last
;; element of the queue. The cdr of this element is the empty list. That's why we see
;; and empty list as the car in the printed queue. The rear-ptr on the other side is not
;; moved at all when deleting, so it remains pointing the last element of the queue: the b

(define (print-queue queue)
  (display (front-ptr queue)))

(print-queue q1)
;Value: ()

(insert-queue! q1 'a)

(print-queue q1)
;Value 4: (a)

(insert-queue! q1 'b)
(insert-queue! q1 'c)

(print-queue q1)
;Value 4: (a b c)

