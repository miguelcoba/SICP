(define (queens board-size)
  (define (queen-cols k)
    (if (= k 0)
	(list empty-board)
	(filter
	 (lambda (positions) (safe? k positions))
	 (flatmap
	  (lambda (rest-of-queens)
	    (map (lambda (new-row)
		   (adjoin-position new-row k rest-of-queens))
		 (enumerate-interval 1 board-size)))
	  (queen-cols (- k 1))))))
  (queen-cols board-size))

(define (adjoin-position row col rest-of-queens)
  (cons (cons row col) rest-of-queens))

(define (row position)
  (car position))

(define (col position)
  (cdr position))

(define empty-board nil)

(define (safe? column positions)
  (define (safe-queen? queen rest-of-queens)
    (cond ((null? rest-of-queens) true)
	  ((or (= (row queen) (row (car rest-of-queens)))  ; queen on same row as next queen
	       (= (abs (- (row queen) (row (car rest-of-queens)))) ; or same diagonal
		  (abs (- (col queen) (col (car rest-of-queens)))))) false)
	  (else (safe-queen? queen (cdr rest-of-queens))))) ; recurse
  (safe-queen? (car positions) (cdr positions)))

(queens 1)
;Value 46: (((1 . 1)))

(queens 2)
;Value: ()

(queens 3)
;Value: ()

(queens 4)
;Value 47: (((3 . 4) (1 . 3) (4 . 2) (2 . 1)) ((2 . 4) (4 . 3) (1 . 2) (3 . 1)))

(queens 5)
;Value 48: (((4 . 5) (2 . 4) (5 . 3) (3 . 2) (1 . 1)) ((3 . 5) (5 . 4) (2 . 3) (4 . 2) (1 . 1)) ((5 . 5) (3 . 4) (1 . 3) (4 . 2) (2 . 1)) ((4 . 5) (1 . 4) (3 . 3) (5 . 2) (2 . 1)) ((5 . 5) (2 . 4) (4 . 3) (1 . 2) (3 . 1)) ((1 . 5) (4 . 4) (2 . 3) (5 . 2) (3 . 1)) ((2 . 5) (5 . 4) (3 . 3) (1 . 2) (4 . 1)) ((1 . 5) (3 . 4) (5 . 3) (2 . 2) (4 . 1)) ((3 . 5) (1 . 4) (4 . 3) (2 . 2) (5 . 1)) ((2 . 5) (4 . 4) (1 . 3) (3 . 2) (5 . 1)))


