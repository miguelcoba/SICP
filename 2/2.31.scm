(define (square x)
  (* x x))

;; without high-order procedures
(define (tree-map operation tree)
  (cond ((null? tree) '())
        ((not (pair? tree)) (operation tree))
        (else (cons (tree-map operation (car tree))
                    (tree-map operation (cdr tree))))))

(define (square-tree tree) (tree-map square tree))

(square-tree
 (list 1
       (list 2 (list 3 4 ) 5)
       (list 6 7)))

;; Using map
(define (tree-map operation tree)
  (map (lambda (sub-tree)
         (if (pair? sub-tree)
             (tree-map operation sub-tree)
             (operation sub-tree)))
       tree))

(define (square-tree tree) (tree-map square tree))

(square-tree
 (list 1
       (list 2 (list 3 4 ) 5)
       (list 6 7)))
