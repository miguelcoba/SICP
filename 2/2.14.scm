(define r1 (make-interval 2 4))

(define r2 (make-interval 5 7))

; Both functions give distinct results
(par1 r1 r2)
(0.90909090 4)

(par2 r1 r2)
(1.428571 2.545454)

(define A (make-interval 99 101))

(define B (make-interval 199 201))

(define C (make-interval 999 1001))

racket@> (div-interval A A)
'(0.9801980198019802 . 1.0202020202020203)
racket@> (div-interval B B)
'(0.990049751243781 . 1.0100502512562815)
racket@> (div-interval C C)
'(0.998001998001998 . 1.002002002002002)

; So A/A doesn't give 1 for intervals. 
; The transformation from one formula to the other assumes that A/A 
; are exactly divisible:
;   R1R2      R1R2     1/(R1R2)    (R1R2)/(R1R2)             1
; -------- = ------- * -------- = ----------------------= -------
; R1 + R2    R1 + R2   1/(R1R2)    R1/(R1R2) + R2/(R1R2)  R2 + R1
; So both formulas aren't equivalent and that is the reason of the 
; distinct results
