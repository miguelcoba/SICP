(define tree (generate-huffman-tree '((A 2) (BOOM 1) (GET 2) (JOB 2) (NA 16) (SHA 3) (YIP 9) (WAH 1))))

(define message '(Get a job
		      Sha na na na na na na na na
		      Get a job
		      Sha na na na na na na na na
		      Wah yip yip yip yip yip yip yip yip yip
		      Sha boom))

(encode message tree)
;Value: (1 1 1 1 1 1 1 0 0 1 1 1 1 0 1 1 1 0 0 0 0 0 0 0 0 0 1 1 1 1 1 1 1 0 0 1 1 1 1 0 1 1 1 0 0 0 0 0 0 0 0 0 1 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 1 1 0 1 1 0 1 1)

(length (encode message tree))
;Value: 84

;; we have 8 symbols, so 3 bits are required to encode them. If we use a fixed-length code, we
;; would need 3 bits for each symbol. There are 36 symbols in the message so we need 108 bits

(length '(Get a job
		      Sha na na na na na na na na
		      Get a job
		      Sha na na na na na na na na
		      Wah yip yip yip yip yip yip yip yip yip
		      Sha boom))
