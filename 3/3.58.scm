(define (expand num den radix)
  (cons-stream
   (quotient (* num radix) den)
   (expand (remainder (* num radix) den) den radix)))

(display-stream (expand 1 7 10))
1
4
2
8
5
7

;; are the digits of the decimal part of the fraciton 1/7= 0.1428514285

(display-stream (expand 3 8 10))
3
7
5
0
0
0
;; are the digits of the decimal part of the fraciton 1/7= 0.375

