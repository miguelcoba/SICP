; Calculate bounds with a center and a percent
; center = c = 500
; percent = 10%
; p = (c * percent) / 100% = (10 * 500) / 100 = 50
; i = ((- c p) (+ c p)) = ((- 500 50) (+ 500 50)) = (450 550)
(define (make-center-percent c percent)
  (let ((p (/ (* c percent) 100)))
    (make-interval (- c p) (+ c p))))

(define (center i)
  (/ (+ (lower-bound i) (upper-bound i)) 2))

; Percent
; i = (450 550)
; w = width (i) = 50
; c = center (i) = 500
; p = (w / c) * 100
(define (percent i)
  (* (/ (width i) (center i)) 100))
