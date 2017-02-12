(define sum 0)

(define (accum x)
  (set! sum (+ x sum))
  sum)

(define seq (stream-map accum (stream-enumerate-interval 1 20)))
sum
;Value: 1

(define y (stream-filter even? seq))
sum
;Value: 6

(define z (stream-filter (lambda (x) (= (remainder x 5) 0)) seq))
sum
;Value: 10

(stream-ref y 7)
;Value: 136

(display-stream z)
;Value: 136

;; without memo-proc the sum would be modified each time the seq is accessed as the result
;; of applying accum to the argument would never be memoized
