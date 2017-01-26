(define (dot-product v w)
  (accumulate + 0 (map * v w)))

;; (1 2 3) . (4 5 6) = 1x2 + 2x5 + 3x6 = 2 + 10 + 18 = 32
(dot-product (list 1 2 3) (list 4 5 6))
;Value: 32

(define (matrix-*-vector m v)
  (map (lambda (w) (dot-product w v)) m))

;; ((1 2) (3 4)) * (5 6) = (1x5+2x6 3*5+4x6) = (5+12 15+24) = (17 39)
(matrix-*-vector (list (list 1 2) (list 3 4)) (list 5 6))
;Value: (17 39)

(define nil '())

(define (transpose mat)
  (accumulate-n cons nil mat))

;; ((1 2 3) (4 5 6) (7 8 9)) transposed is: ((1 4 7) (2 5 8) (3 6 9))
(transpose (list (list 1 2 3) (list 4 5 6) (list 7 8 9)))
;Value 3: ((1 4 7) (2 5 8) (3 6 9))

(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map (lambda (p)
	   (map (lambda (c) (dot-product p c)) cols))
	 m)))

;; (1 2 3)   (9 8 7)   (1x9+2x6+3x3 1x8+2x5+3x2 1x7+2x4+3x1)
;; (4 5 6) * (6 5 4) = (4x9+5x6+6x3 4x8+5x5+6x2 4x7+5x4+6x1)
;; (7 8 9)   (3 2 1)   (7x9+8x6+9x3 7x8+8x5+9x2 7x7+8x4+9x1)
;;                     (9+12+9 8+10+6 7+8+3)         (30   24  14)
;;                   = (36+30+18 32+25+12 28+20+6) = (84   69  54)
;;                     (63+48+27 56+40+18 49+32+9)   (138 114  90)
(matrix-*-matrix (list (list 1 2 3) (list 4 5 6) (list 7 8 9))
		 (list (list 9 8 7) (list 6 5 4) (list 3 2 1)))
;Value 4: ((30 24 18) (84 69 54) (138 114 90))

		  
