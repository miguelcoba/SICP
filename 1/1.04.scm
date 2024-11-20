(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

;; if b is > 0 it will sum a and b
;; else it will return the difference between a and b
;; example

(a-plus-abs-b 1 3)
((if (> 3 0) + -) 1 3)
((if #t + -) 1 3)
(+ 1 3)
4

(a-plus-abs-b 1 -3)
((if (> -3 0) + -) 1 -3)
((if #f + -) 1 -3)
(- 1 -3)
4
