(define (make-account balance password)
  (define (withdraw amount)
    (if (>= balance amount)
        (begin (set! balance (- balance amount))
               balance)
        "Insufficient funds"))
  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)
  (define (dispatch pw m)
    (if (eq? pw password)
	(cond ((eq? m 'withdraw) withdraw)
	      ((eq? m 'deposit) deposit)
	      (else (error "Unknown request -- MAKE-ACCOUNT"
			   m)))
	(error "Incorrect password")))
  dispatch)

(define (make-joint account unlock-password new-password)
  (lambda (pw m)
    (if (eq? pw new-password)
	(account unlock-password m)
	(error "Incorrect password -- MAKE_JOINT"))))

(define peter-acc (make-account 100 'open-sesame))

((peter-acc 'open-sesame 'deposit) 50)
;Value: 150

(define paul-acc
  (make-joint peter-acc 'open-sesame 'rosebud))

((paul-acc 'rosebud 'deposit) 10)
;Value: 160

((paul-acc 'rosebud 'withdraw) 100)
;Value: 60

((peter-acc 'open-sesame 'withdraw) 10)
;Value: 50
