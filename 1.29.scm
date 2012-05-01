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
  (define (coef k)  ; Calcula el coeficiente para el término k
    (cond ((= k 0) 1)
	  ((= k n) 1)
	  ((even? k) 2)
	  (else 4)))
  (define (term k)
    (* (coef k) (y k)))
  (* (/ h 3) (sum term 0 inc n)))
    
