(define memo-fib
  (memoize (lambda (n)
             (cond ((= n 0) 0)
                   ((= n 1) 1)
                   (else (+ (memo-fib (- n 1))
                            (memo-fib (- n 2))))))))

(define (memoize f)
  (let ((table (make-table)))
    (lambda (x)
      (let ((previously-computed-result (lookup x table)))
        (or previously-computed-result
            (let ((result (f x)))
              (insert! x result table)
              result))))))

;; Explain why memo-fib computes the nth Fibonacci number in a number of steps proportional to n
;; Because each time memo-fib calculates a value this is stored in the table and never calculated
;; again. As calculating fib(n) requires calculanting fib for every number less than n, this
;; results in each value from 0 to n being calculated only once. So it is proportional to n

;; Would the scheme still work if we had simply defined memo-fib to be (memoize fib)?
;; no because internally the memoized fib would be calling the not memoized fib (the original)
;; on the else part of the cond
