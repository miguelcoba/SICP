(define (element-of-set? x set)
  (cond ((null? set) false)
	((equal? x (car set)) true)
	(else (element-of-set? x (cdr set)))))

(define (encode message tree)
  (if (null? message)
      '()
      (append (encode-symbol (car message) tree)
	      (encode (cdr message) tree))))

(define (encode-symbol symbol tree)
  (cond ((leaf? tree) '())
	((element-of-set? symbol (symbols (left-branch tree)))
	 (cons 0 (encode-symbol symbol (left-branch tree))))
	((element-of-set? symbol (symbols (right-branch tree)))
	 (cons 1 (encode-symbol symbol (right-branch tree))))
	(else (error "unknown symbol -- ENCODE-SYMBOL" symbol))))



(encode-symbol 'a sample-tree)
;Value: (0)

(encode-symbol 'b sample-tree)
;Value: (1 0)

(encode-symbol 'c sample-tree)
;Value: (1 1 1)

(encode-symbol 'd sample-tree)
;Value: (1 1 0)

(encode-symbol 'e sample-tree)
;unknown symbol -- ENCODE-SYMBOL e
