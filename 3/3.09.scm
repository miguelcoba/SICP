(define (factorial n)
  (if (= n 1)
      1
      (* n (factorial (- n 1)))))

;;global env
;;  +-----------------------+
;;  | factorial ---|        |
;;  |              |        |
;;  +--------------|--------+
;;                 |   ^
;;                 |   |
;;              ( )( )-+
;;               |
;;     parameters: n
;;     body: (if (= n 1)
;;               1
;;               (* n (factorial (- n 1))))
;;
;;
;; Evaluating (factorial 6)
;;global env
;;  +-----------------------------------------------------------------------------------------+
;;  |                                                                                         |
;;  |                                                                                         |
;;  +-----------------------------------------------------------------------------------------+
;;        ^           ^           ^           ^           ^           ^
;;        |           |           |           |           |           |
;;  E1->|n:6|   E2->|n:5|   E3->|n:4|   E4->|n:3|   E5->|n:2|   E6->|n:1|
;;
;;  factorial   factorial   factorial   factorial   factorial   factorial
;;  body        body        body        body        body        body


(define (factorial n)
  (fact-iter 1 1 n))
(define (fact-iter product counter max-count)
  (if (> counter max-count)
      product
      (fact-iter (* counter product)
                 (+ counter 1)
                 max-count)))

;;global env
;;  +----------------------------------------------------------------------------------------+
;;  | factorial-iter -------------------|                                                    |
;;  | factorial ---|                    |                                                    |
;;  |              |                    |                                                    |
;;  +--------------|--------------------|----------------------------------------------------+
;;                 |   ^                |   ^
;;                 |   |                |   |
;;              ( )( )-+             ( )( )-+
;;               |                    |
;;     parameters: n                parameters: product counter max-count
;;     body: (fact-iter 1 1 n)      body: (if (> counter max-count)
;;                                            product
;;                                            (fact-iter (* counter product)
;;                                                       (+ counter 1)
;;                                                       max-count)))
;;
;;
;; Evaluating (factorial 6)
;;global env
;;  +-----------------------------------------------------------------------------------------+
;;  |                                                                                         |
;;  |                                                                                         |
;;  +-----------------------------------------------------------------------------------------+
;;        ^            ^                 ^                   ^                      ^
;;        |            |                 |                   |                      |
;;  E1->|n:6| E2->|product:1  | E3->|product:1  |   E4->|product:2  |      E8->|product:720|
;;                |counter:1  |     |counter:2  |       |counter:3  | ...      |counter:7  |
;;                |max-count:6|     |max-count:6|       |max-count:6|          |max-count:6|
;;
;;  factorial   factorial-iter    factorial-iter       factorial-iter       factorial-iter
;;  body        body              body                 body                 body
