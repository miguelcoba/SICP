(define (width x)
  (/ (- (upper-bound x) (lower-bound x)) 2))

(aL aU) + (bL bU) = ((aL + bL) (aU + bU))
width ((aL aU) + (bL bU)) = 1/2 * ((aU + bU) - (aL + bL))
                          = 1/2 * (aU + bU - aL - bL)
                          = 1/2 * ((aU - aL) + (bU - bL))
                          = 1/2 * (aU - aL) + 1/2 * (bU - bL)
                          = width (a) + width (b)

So width (a + b) = width a + width b

