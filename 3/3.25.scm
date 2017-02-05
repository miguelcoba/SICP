;; using the equal? procedure, any key could be used, including a list as the key
;; no changes are required

(define table (make-table))

(insert! '(a) 1 table)

(lookup '(a) table)
;Value: 1

(insert! '(a b) 2 table)

(lookup '(a b) table)
;Value: 2

(lookup '(a x y) table)
;Value: #f

(insert! '(a x y) 3 table)

(lookup '(a x y) table)
;Value: 3

(insert! '(a) 4 table)

(lookup '(a) table)
;Value: 4
