(define (mystery x)
  (define (loop x y)
    (if (null? x)
        y
        (let ((temp (cdr x)))
          (set-cdr! x y)
          (loop temp x))))
  (loop x '()))

;; gets each head of the list and sets it as the cdr of a new list on each iteration over the
;; elements of the original list

(define v (list 'a 'b 'c 'd))

;; v -> [ | ] -> [ | ] -> [ | ] -> [ |/]
;;       |        |        |        |
;;      [a]      [b]      [c]      [d]

(define w (mystery v))

;;                              v --+
;;                                  |
;;                                  v
;; w -> [ | ] -> [ | ] -> [ | ] -> [ |/] 
;;       |        |        |        |
;;      [d]      [c]      [b]      [a]

