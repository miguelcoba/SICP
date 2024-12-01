; 1.1 The Elements of Programming
; 1.1.7 Example: Square Roots by Newton's Method

(define (square x)
   (* x x))

(define (sum-of-squares x y)
  (+ (square x) (square y)))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (average x y)
  (/ (+ x y) 2))

(define (improve guess x)
  (average guess (/ x guess)))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x) x)))

(define (sqrt x)
  (sqrt-iter 1.0 x))


