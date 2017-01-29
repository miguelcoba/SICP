(define (generate-huffman-tree pairs)
  (successive-merge (make-leaf-set pairs)))

(define (successive-merge set-of-leaves)
  (if (null? (cdr set-of-leaves))
      set-of-leaves
      (successive-merge (adjoin-set (make-code-tree (car set-of-leaves) (cadr set-of-leaves))
				    (cddr set-of-leaves)))))

;; test
(generate-huffman-tree '((A 4) (B 2) (C 1) (D 1)))
;Value: (((leaf a 4) ((leaf b 2) ((leaf d 1) (leaf c 1) (d c) 2) (b d c) 4) (a b d c) 8))
