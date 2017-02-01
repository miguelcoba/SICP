(define rand
  (let ((x random-init))
    (lambda (arg)
      (cond ((eq? arg 'generate)
	     (set! x (rand-update x))
	     x)
	    ((eq? arg 'reset)
	     (lambda (new-value)
	       (set! x new-value)))
	    (else (error "Invalid operation" arg))))))

(define random-init 0)

(define (rand-update x) (+ x 1))


(rand 'generate)
;Value: 1
	     
(rand 'generate)
;Value: 2

(rand 'generate)
;Value: 3

((rand 'reset) 0)

(rand 'generate)
;Value: 1
