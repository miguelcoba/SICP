;; creates a list with the current mapped value consed to the already mapped, accumulated rest
(define (map p sequence)
  (accumulate (lambda (x y) (cons (p x) y)) nil sequence))

;; cons recursively each seq1 element in order. the first cons is with seq2 that will
;; be executed last after the recursion ends backtracking
(define (append seq1 seq2)
  (accumulate cons seq2 seq1))

;; lambda add one to current accumulator
(define (length sequence)
  (accumulate (lambda (x y) (+ y 1)) 0 sequence))

  
  
