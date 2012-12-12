; From sicp.org.ua/sicp/Exercise2-32:
; Explenation: Mathematically speaking we are looking for the power set of s. The power set can constructed recursively with those steps:
; 1. The power set of nil is (list nil), because the power set of the empty set is the set which contains only the empty set.
; 2. The power set of every other (i.e. non-empty) set is the union of
;    a. The set of all subsets of s that don't contain a certain element (in our case the first element of s), and
;    b. The set of all subsets from (a) with the missing element added to them.
; In our function (a) is represented by the list rest, and (b) is accomplished by the lambda construct.

(define (subsets s)
  (if (null? s)
      (list '())
      (let ((rest (subsets (cdr s))))
        (append rest (map (lambda (x)
                            (cons (car s) x)) rest)))))

(subsets '(1 2 3))
