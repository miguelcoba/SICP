;; Not needed if the harware doesn't allow concurrent writing of the memory where the var is
;; allocated.
;; Maybe it would be needed if the hardware allow read a memory location while it is being
;; written and this would result in reading mixed old and new values.
