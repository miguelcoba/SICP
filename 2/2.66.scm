(define (lookup given-key set-of-records)
  (cond ((null? set-of-records) false)
	((equal? given-key (entry set-of-records))
	 (entry set-of-records))
	((< given-key (entry set-of-records))
	 (lookup given-key (left-branch set-of-records)))
	((> given-key (entry set-of-records))
	 (lookup given-key (right-branch set-of-records)))))

;; test

(lookup 1 (list->tree '(1 2 3 4 5)))
;Value: 1

(lookup 3 (list->tree '(1 2 3 4 5)))
;Value: 3

(lookup 5 (list->tree '(1 2 3 4 5)))
;Value: 5

(lookup 7 (list->tree '(1 2 3 4 5)))
;Value: #f


	
