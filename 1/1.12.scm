;; Pascal triangle
;;         1
;;       1   1
;;     1   2   1
;;   1   3   3   1
;; 1   4   6   4   1

;; rows and cols
;;         col
;;      1  2  3  4  5 6
;;   1  1
;; r 2  1  1
;; o 3  1  2  1
;; w 4  1  3  3  1
;;   5  1  4  6  4  1
;;   6  1  5 10 10  5  1

(define (pascal row col)
  (cond ((or (< row col) (< col 1)) 0)
	((or (= col 1) (= row col)) 1)
	(else (+ (pascal (- row 1) (- col 1))
		  (pascal (- row 1) col)))))
