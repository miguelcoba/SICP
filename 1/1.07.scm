; This version compares the difference between this iteration guess and 
; next calculated guess
(define (good-enough? guess x)
  (< (abs (- (improve guess x) guess))
     (abs (* guess 0.001))))
