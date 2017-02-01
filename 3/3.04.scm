(define (make-account balance password)
  (let ((retries 0))
    (define (call-the-cops)
      (error "Too many retries. Cops called"))
    (define (withdraw amount)
      (if (>= balance amount)
	  (begin (set! balance (- balance amount))
		 balance)
	  "Insufficient funds"))
    (define (deposit amount)
      (set! balance (+ balance amount))
      balance)
    (define (dispatch pw m)
      (cond ((eq? pw password)
	     (set! retries 0)
	     (cond ((eq? m 'withdraw) withdraw)
		   ((eq? m 'deposit) deposit)
		   (else (error "Unknown request -- MAKE-ACCOUNT"
				m))))
	    (else
	     (set! retries (+ retries 1))
	     (if (>= retries 7)
		 (call-the-cops)
		 (error "Incorrect password")))))
    dispatch))

(define acc (make-account 100 'secret-password))

((acc 'secret-password 'withdraw) 40)
;Value: 60

((acc 'some-other-password 'deposit) 50)
;Incorrect password

((acc 'some-other-password 'deposit) 50)
;Incorrect password

((acc 'some-other-password 'deposit) 50)
;Incorrect password

((acc 'some-other-password 'deposit) 50)
;Incorrect password

((acc 'some-other-password 'deposit) 50)
;Incorrect password

((acc 'some-other-password 'deposit) 50)
;Incorrect password

((acc 'some-other-password 'deposit) 50)
;Too many retries. Cops called
