(define (square x) (* x x))

(define (f g)
  (g 2))

(f square)

(f (lambda (z) (* z (+ z 1))))

;; What happens if we (perversely) ask the interpreter to evaluate the combination (f f)?
(f f)
;; applying the definition of f
(f 2)
;; applying the definition of f, again
(2 2)
;; the value of the operator (first 2) is not a procedure so it can't be applied to the value
;; of the argument (second 2), so an error will 


