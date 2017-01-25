(define (cube x) (* x x x))

(define (inc x ) (+ x 1))

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
	 (sum term (next a) next b))))

(define (simpson-rule f a b n)
  (define h (/ (- b a) n))
  (define (y k) (f (+ a (* k h))))
  (define (coef k)  ; Calculates Yk coeficient
    (cond ((= k 0) 1)
	  ((= k n) 1)
	  ((even? k) 2)
	  (else 4)))
  (define (term k)
    (* (coef k) (y k)))
  (* (/ h 3) (sum term 0 inc n)))
    
(simpson-rule cube 0 1.0 100)
;Value: .24999999999999992

(simpson-rule cube 0 1.0 1000)
;Value: .2500000000000003
