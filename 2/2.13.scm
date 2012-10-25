; If all numbers are positive then the mul-interval is

(define (mul-interval x y)
  (make-interval (* (lower-bound x) (lower-bound y))
		 (* (upper-bound x) (upper-bound y))))

(a b) * (c d) = (a*c b*d)

; if x and y are center/percent intervals (x px) and (y py)
; then:
; x = ((x - x*px) (x + x*px))
; y = ((y - y*py) (y + y*py))
; x*y = (((x - x*px)*(y - y*py)) ((x + x*px)*(y + y*py)))
; x*y = ((x*y - x*y*py -x*px*y + x*px*y*py) (x*y + x*y*py + x*px*y + x*px*y*py))
; if the percents px and py are small, their product is negligible, so
; x*y = ((x*y - x*y*py - x*y*px) (x*y + x*y*py + x*y*px))
; x*y = ((x*y* - x*y*(px + py)) (x*y + x*y*(px + py)))
; if z = x*y and pz = px + py
; z = ((z - z*pz) (z + z*pz))
; where z is analogous to x and y a center/percent interval [z pz]
; and where pz, the tolerance of the product is the sum of the
; tolerance of the factors

