(define (make-cycle x)
  (set-cdr! (last-pair x) x)
  x)

(define z (make-cycle (list 'a 'b 'c)))

;;      +--------------------+
;;      |                    |
;;      \/                   |
;; z -> [ | ] -> [ | ] -> [ | ]
;;       |        |       |
;;      [a]      [b]     [c]

;; What happens if we try to compute (last-pair z)?

;; It will never end as it won't find a null cdr

