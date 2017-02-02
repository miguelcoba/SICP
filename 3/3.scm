;; 3 Modularity, Objects, and State

;; 3.1 Assignment and Local State

;; 3.1.1 Local State Variables

(define balance 100)

(define (withdraw amount)
  (if (>= balance amount)
      (begin (set! balance (- balance amount))
             balance)
      "Insufficient funds"))


(define new-withdraw
  (let ((balance 100))
    (lambda (amount)
      (if (>= balance amount)
          (begin (set! balance (- balance amount))
                 balance)
          "Insufficient funds"))))

(define (make-withdraw balance)
  (lambda (amount)
    (if (>= balance amount)
        (begin (set! balance (- balance amount))
               balance)
        "Insufficient funds")))

(define W1 (make-withdraw 100))
(define W2 (make-withdraw 100))

(W1 50)

(W2 70)

(W2 40)

(W1 40)

(define (make-account balance)
  (define (withdraw amount)
    (if (>= balance amount)
        (begin (set! balance (- balance amount))
               balance)
        "Insufficient funds"))
  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)
  (define (dispatch m)
    (cond ((eq? m 'withdraw) withdraw)
          ((eq? m 'deposit) deposit)
          (else (error "Unknown request -- MAKE-ACCOUNT"
                       m))))
  dispatch)


(define acc (make-account 100))
((acc 'withdraw) 50)

((acc 'withdraw) 60)

((acc 'deposit) 40)

((acc 'withdraw) 60)

;; 3.1.2 The Benefits of Introducing Assignment

(define rand
  (let ((x random-init))
    (lambda ()
      (set! x (rand-update x))
      x)))

(define (estimate-pi trials)
  (sqrt (/ (monte-carlo trials cesaro-test))))

(define (cesaro-test)
  (= (gcd (rand) (rand)) 1))

(define (monte-carlo trials experiment)
  (define (iter trials-remaining trials-passed)
    (cond ((= trials-remaining 0)
	   (/ trials-passed trials))
	  ((experiment)
	   (iter (- trials-remaining 1) (+ trials-passed 1)))
	  (else (iter (- trials-remaining 1) trials-passed))))
  (iter trials 0))

(define (estimate-pi trials)
  (sqrt (/ 6 (random-gcd-test trials random-init))))
(define (random-gcd-test trials initial-x)
  (define (iter trials-remaining trials-passed x)
    (let ((x1 (rand-update x)))
      (let ((x2 (rand-update x1)))
        (cond ((= trials-remaining 0)   
               (/ trials-passed trials))
              ((= (gcd x1 x2) 1)
               (iter (- trials-remaining 1)
                     (+ trials-passed 1)
                     x2))
              (else
               (iter (- trials-remaining 1)
                     trials-passed
                     x2))))))
  (iter trials 0 initial-x))

;; The Costs of Introducing Assignment

(define (make-simplified-withdraw balance)
  (lambda (amount)
    (set! balance (- balance amount))
    balance))
(define W (make-simplified-withdraw 25))

(W 20)

(W 10)

(define (make-decrementer balance)
  (lambda (amount)
    (- balance amount)))

(define D (make-decrementer 25))

(D 20)

(D 10)

;; Sameness and change

(define D1 (make-decrementer 25))
(define D2 (make-decrementer 25))

(define W1 (make-simplified-withdraw 25))
(define W2 (make-simplified-withdraw 25))

;; Pitfalls of imperative programming

;; 3.2 The Environment Model of Evaluation

;; 3.2.1 The Rules for Evaluation

;; 3.2.2 Applyting Simple Procedures

(define (square x)
  (* x x))
(define (sum-of-squares x y)
  (+ (square x) (square y)))
(define (f a)
  (sum-of-squares (+ a 1) (* a 2)))

;; 3.2.3 Frames as the Repository of Local State

(define (make-withdraw balance)
  (lambda (amount)
    (if (>= balance amount)
        (begin (set! balance (- balance amount))
               balance)
        "Insufficient funds")))

;; 3.2.4 Internal Definitions

(define (sqrt x)
  (define (good-enough? guess)
    (< (abs (- (square guess) x)) 0.001))
  (define (improve guess)
    (average guess (/ x guess)))
  (define (sqrt-iter guess)
    (if (good-enough? guess)
        guess
        (sqrt-iter (improve guess))))
  (sqrt-iter 1.0))

;; 3.3 Modeling with Mutable Data

;; 3.3.1 Mutable List Structure

(define x '((a b) c d))

(define y '(e f))

(set-car! x y)

(set-cdr! x y)

