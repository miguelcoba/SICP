(define (list->tree elements)
  (car (partial-tree elements (length elements))))

(define (partial-tree elts n)
  (if (= n 0)
      (cons '() elts)
      (let ((left-size (quotient (- n 1) 2)))
        (let ((left-result (partial-tree elts left-size)))
          (let ((left-tree (car left-result))
                (non-left-elts (cdr left-result))
                (right-size (- n (+ left-size 1))))
            (let ((this-entry (car non-left-elts))
                  (right-result (partial-tree (cdr non-left-elts)
                                              right-size)))
              (let ((right-tree (car right-result))
                    (remaining-elts (cdr right-result)))
                (cons (make-tree this-entry left-tree right-tree)
                      remaining-elts))))))))

;; a. recursively tries to create a tree by halving the number of elements in two.
;; the first hallf is used to build the left tree, the second half is used to build the right
;; tree. After having two subtrees, creates a tree using the middle entry and the two trees
;; As the initial list is already ordered, the resulting tree is guaranteed to be balanced

(list->tree '(1 3 5 7 9 11))
;Value 143: (5 (1 () (3 () ())) (9 (7 () ()) (11 () ())))

;;       5
;;     /   \
;;   1       9
;;    \     / \
;;      3  7   11

;; b. As each recursive call halves the list passed to form the subtrees. Then combine these
;; trees to build the result. Each time it recurses, pivots on the middle element until it
;; runs out of elements, never pivoting again on it. So it does this for each of the n elements
;; of the tree and so the number of steps is linear with the input, givin O(n)
