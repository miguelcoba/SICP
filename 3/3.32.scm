;; if we use a queue, the current values are
;;   a0 = 0, a1 = 1
;; and in the queue there would be
;;   (1 0)
;; those would be applied in order, first the 1
;;   a0 = 1
;; then the 0
;;   a1 = 0
;; and the result calculated last, and the wire values would be
;;   1 and 0 = 0
;;   a0 = 1, a1 = 0

;; if we use a list, the current values are
;;   a0 = 0, a1 = 1
;; and in the list there would be (inserting on the left)
;;   (0 1)
;; those would be applied in list order (removed from the left), first the 0
;;   a0 = 0
;; then the 1
;;   a1 = 1
;; the result would be the same, but the values on the wire would be incorrect
;;   1 and 0 = 0
;;   a0 = 0, a1 = 1
