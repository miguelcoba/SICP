(define (append x y)
  (if (null? x)
      y
      (cons (car x) (append (cdr x) y))))

(define (append! x y)
  (set-cdr! (last-pair x) y)
  x)

(define (last-pair x)
  (if (null? (cdr x))
      x
      (last-pair (cdr x))))

(define x (list 'a 'b))
(define y (list 'c 'd))
;; x -> [ | ] -> [ |/]
;;       |        |
;;      [a]      [b]
;; y -> [ | ] -> [ |/]
;;       |        |
;;      [c]       [d]


(define z (append x y))
;; x -> [ | ] -> [ |/]
;;       |        |
;;      [a]      [b]
;; y -> [ | ] -> [ |/]
;;       |        |
;;      [c]       [d]
;; z -> [ | ] -> [ | ] -> [ | ] -> [ |/]
;;       |        |        |        |
;;      [a]       [b]     [c]       [d]

z
;Value: (a b c d)
(cdr x)
;Value: (b)



(define w (append! x y))
;; z ---+
;;      |
;;      \/
;; x -> [ | ] -> [ | ] ---+
;;       |        |       |
;;      [a]      [b]      \/
;; y ------------------> [ | ] -> [ |/]
;;                        |        |
;;                       [c]       [d]

w
;Value: (a b c d)
(cdr x)
;Value: (b c d)

