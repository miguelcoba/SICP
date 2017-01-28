(define (augend s)
  (if (null? (cdddr s)) ; no third term
       (caddr s)
       (make-sum (caddr s) (cadddr s)))))

(define (multiplicand s)
  (if (null? (cdddr s)) ; no third factor
       (caddr s)
       (make-product (caddr s) (cadddr s)))))

(deriv '(* (* x y) (+ x 3)) 'x)
;Value: (+ (* x y) (* (+ x 3) y))

(deriv '(* x y (+ x 3)) 'x)
;Value 93: (+ (* x y) (* y (+ x 3)))


