;; let's compare current guess with next guess and if the difference
;; is less than 0.001 of current guest, that's good enough
(define (good-enough? guess x)
  (< (abs (- (improve guess x) guess))
     (abs (* guess 0.001))))
