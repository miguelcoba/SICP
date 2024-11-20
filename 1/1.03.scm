(define (square x)
  (* x x))

(define (sum-of-squares x y)
  (+ (square x) (square y)))

(define (sum-of-squares-biggest-two a b c)
  (if (> a b)
       (if (> b c)
	   (sum-of-squares a b)
	   (sum-of-squares a c))
       (if (> a c)
	   (sum-of-squares b a)
	   (sum-of-squares b c))))


(sum-of-squares-biggest-two 1 2 3)
; 2*2 + 3*3 = 4 + 9
;Value: 13

(sum-of-squares-biggest-two 2 3 1)
;Value: 13

(sum-of-squares-biggest-two 3 1 2)
;Value: 13

(sum-of-squares-biggest-two 1 1 2)
;Value: 5
