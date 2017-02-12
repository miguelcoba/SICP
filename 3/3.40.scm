(define x 10)

(parallel-execute (lambda () (set! x (* x x)))
                  (lambda () (set! x (* x x x))))


1000000: P1 sets x to 100 and then P2 sets x to 1,000,000.
1000000: P2 sets x to 1,000 and then P1 sets x 1000*1000 = 1,000,000

100000: P2 accesses x once, then P1 sets x to 100, then P2 access x twice and sets x to (* 10 100 100)
10000: P2 accesses x twice, then P1 sets x to 100, then P2 access x once and sets x to (* 10 10 100)
1000: P2 accesses x thrice, then P1 sets x to 100, then P2 sets x to (* 10 10 10)
10000: P1 accesses x once, then P2 sets x to 1000, then P1 access x once and sets x to (* 10 1000)
100: P1 accesses x twice, then P2 sets x to 1000, then P1 sets x to (* 10 10)


;; Which of these possibilities remain if we instead use serialized procedures:

(define x 10)

(define s (make-serializer))

(parallel-execute (s (lambda () (set! x (* x x))))
                  (s (lambda () (set! x (* x x x)))))

1000000: P1 sets x to 100 and then P2 sets x to 1,000,000.
1000000: P2 sets x to 1,000 and then P1 sets x 1000*1000 = 1,000,000
