(generate-huffman-tree '((a 1) (b 2) (c 4) (d 8) (e 16)))
;Value: (((((leaf a 1) (leaf b 2) (a b) 3) (leaf c 4) (a b c) 7) (leaf d 8) (a b c d) 15) (leaf e 16) (a b c d e) 31)

;;                  {a b c d e} 31
;;                    /          \
;;           {a b c d} 15        (e 16)
;;            /        \
;;      {a b c} 7      (d 8)
;;       /      \
;;   {a b} 3    (c 4)
;;    /   \
;; (a 1)  (b 2)


(generate-huffman-tree '((a 1) (b 2) (c 4) (d 8) (e 16) (f 32) (g 64) (h 128) (i 256) (j 512)))
;Value: ((((((((((leaf a 1) (leaf b 2) (a b) 3) (leaf c 4) (a b c) 7) (leaf d 8) (a b c d) 15) (leaf e 16) (a b c d e) 31) (leaf f 32) (a b c d e f) 63) (leaf g 64) (a b c d e f g) 127) (leaf h 128) (a b c d e f g h) 255) (leaf i 256) (a b c d e f g h i) 511) (leaf j 512) (a b c d e f g h i j) 1023)

;;                                                                          {a b c d e f g} 1023
;;                                                                             /          \
;;                                                           {a b c d e f g h i} 511   (j 512)
;;                                                                 /          \
;;                                               {a b c d e f g h} 255   (f 256)
;;                                                   /          \
;;                                   {a b c d e f g} 127   (f 128)
;;                                      /          \
;;                         {a b c d e f} 63    (f 64)
;;                         /              \
;;                  {a b c d e} 31     (f 32)
;;                    /          \
;;           {a b c d} 15      (e 16)
;;            /        \
;;      {a b c} 7      (d 8)
;;       /      \
;;   {a b} 3    (c 4)
;;    /   \
;; (a 1)  (b 2)

;; for the most frequent symbol (freq 2**(n-1)) 1 bit is enough. For the least frequent symbol,
;; (n-1) bits are required
