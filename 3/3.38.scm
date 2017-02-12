;; Peter:	(set! balance (+ balance 10))
;; Paul:	(set! balance (- balance 20))
;; Mary:	(set! balance (- balance (/ balance 2)))

;; a)

(set! balance (+ balance 10))
(set! balance (- balance 20))
(set! balance (- balance (/ balance 2)))

;; peter first
(100 + 10 - 20) / 2 = 45

(100 + 10) / 2 - 20 = 35

;; paul first
(100 - 20 + 10) / 2 = 45

(100 - 20) / 2 + 10 = 50

;; mary first
100 / 2 + 10 - 20 = 40

100 / 2 - 20 + 10 = 40

;; b)
