(define (width x)
  (/ (- (upper-bound x) (lower-bound x)) 2))

; sum
(aL aU) + (bL bU) = ((aL + bL) (aU + bU))
width ((aL aU) + (bL bU)) = 1/2 * ((aU + bU) - (aL + bL))
                          = 1/2 * (aU + bU - aL - bL)
                          = 1/2 * ((aU - aL) + (bU - bL))
                          = 1/2 * (aU - aL) + 1/2 * (bU - bL)
                          = width (a) + width (b)

So width (a + b) = width(a) + width(b)

; difference
(aL aU) - (bL bU) = ((aL - bU) (aU - bL))
width ((aL aU) - (bL bU)) = width (((aL - bU) (aU - bL)))
                          = 1/2 * ((aU - bL) - (aL - bU))
                          = 1/2 * (aU - bL - aL + bU)
                          = 1/2 * (aU - aL + bU - bL)
                          = 1/2 * ((aU - aL) + (bU - bL))
                          = 1/2 * (aU - aL) + 1/2 * (bU - bL)
                          = width (a) + width(b)

So width (a - b) = width(a) + width(b) 

; product (examples)
; If the width of the product depends only on the widths of the
; intervals, then 2 sets of intevals with the same widths must give
; the same width for their product
; i1 = (1 5), width(i1) = 2
; i2 = (6 8), width(i2) = 1
; i1*i2 = (6 40), width(i1*i2) = 17
; i1/i2 = (0.125 0.833333), width(i1/i2) = 0.35416666
; i3 = (6 10), width(i1) = 2
; i4 = (11 13), width(i2) = 1
; i3*i4 = (6 40), width(i1*i2) = 32
; i3/i4 = (0.461538 0.909090), width(i1/i2) = 0.223776223
; So, the width of the product or division of two intervals doesn't 
; depens only on the widths of the intervals
