(define (make-withdraw initial-amount)
  (let ((balance initial-amount))
    (lambda (amount)
      (if (>= balance amount)
          (begin (set! balance (- balance amount))
                 balance)
          "Insufficient funds"))))

;; is in fact:

(define (make-withdraw initial-amount)
  ((lambda (balance)
    (lambda (amount)
      (if (>= balance amount)
          (begin (set! balance (- balance amount))
                 balance)
          "Insufficient funds"))) initial-amount))

;; Evaluating (define W1 (make-withdraw 100))

;;global env
;;  +----------------------------------------------------------------------------------------+
;;  | W1 -------------------------------------------------------------------|                |
;;  | make-withdraw -|                                                      |                |
;;  |                |                                                      |                |
;;  +----------------|------------------------------------------------------|----------------+
;;                   |   ^                    ^                             |   ^
;;                   |   |                    |                             |   |
;;                ( )( )-+             ( )( )-+                          ( )( )-+
;;   parameters: initial-amount      parameters: balance           parameters: amount
;;   body: ((lambda (balance)        body: (lambda (amount)        body: (if (>= balance amount)
;;           (lambda (amount)               (if (>= balance amount)
;;            (if (>= balance amount)           ...))
;;                ...)))
;;           initial-amount)
;;
;;
;;
;;global env
;;  +-----------------------------------------------------------------------------------------+
;;  |                                                                                         |
;;  |                                                                                         |
;;  +-----------------------------------------------------------------------------------------+
;;                ^
;;                |      
;;  E1 -> |initial-amount:100|
;;                          ^
;;  make-withdraw           |
;;  body                    |
;;                          |
;;                          |
;;                      E2 -> |balance:100|
;;
;;                 unnamed lambda
;;                 body
;;

;; Evaluating (W1 50)

;;global env
;;  +-----------------------------------------------------------------------------------------+
;;  |                                                                                         |
;;  |                                                                                         |
;;  +-----------------------------------------------------------------------------------------+
;;                ^
;;                |      
;;  E1 -> |initial-amount:100|
;;  make-withdraw           ^
;;  body                    |
;;                          |
;;                          |
;;                      E2 -> |balance:50|
;;                    unnamed lambda     ^
;;                    body               |
;;                                       |
;;                                       |
;;                           E3 -> |amount:50|
;;                           W1 lambda
;;                           body


;; Evaluating (define W2 (make-withdraw 100))

;;global env
;;  +----------------------------------------------------------------------------------------+
;;  | W2 -------------------------------------------------------------------|                |
;;  | W1 --------------------------------------|                            |                |
;;  | make-withdraw -|                         |                            |                |
;;  |                |                         |                            |                |
;;  +----------------|------------------------------------------------------|----------------+
;;                   |   ^          ^          |   ^            ^           |   ^
;;                   |   |          |          |   |            |           |   |
;;                   |   |          |          |   |            |        ( )( )-+
;;                   |   |          |          |   |            |  parameters: amount
;;                   |   |          |          |   |            |  body: (if (>= balance amount)
;;                   |   |          |          |   |            |
;;                   |   |          |          |   |     ( )( )-+                          
;;                   |   |          |          |   |  parameters: balance           
;;                   |   |          |          |   |  body: (lambda (amount)        
;;                   |   |          |          |   |         (if (>= balance amount)
;;                   |   |          |          |   |              ...))
;;                   |   |          |          |   |
;;                   |   |          |       ( )( )-+
;;                   |   |          |  parameters: amount
;;                   |   |          |  body: (if (>= balance amount)
;;                   |   |          |
;;                   |   |   ( )( )-+                          
;;                   |   |  parameters: balance           
;;                   |   |  body: (lambda (amount)        
;;                   |   |         (if (>= balance amount)
;;                   |   |              ...))
;;                   |   |
;;                ( )( )-+
;;   parameters: initial-amount      
;;   body: ((lambda (balance)        
;;           (lambda (amount)            
;;            (if (>= balance amount)        
;;                ...)))
;;           initial-amount)
;;
;;
;;
;;global env
;;  +-----------------------------------------------------------------------------------------+
;;  |                                                                                         |
;;  |                                                                                         |
;;  +-----------------------------------------------------------------------------------------+
;;                ^                                             ^
;;                |                                             |
;;  E1 -> |initial-amount:100|                    E3 -> |initial-amount: 100|
;;                          ^                                            ^
;;  make-withdraw           |                     make-withdraw          |
;;  body                    |                     body                   |
;;                          |                                            |
;;                          |                                            |
;;                      E2 -> |balance:50|                  E4 -> |balance:100|
;;
;;                      unnamed lambda                      unnamed lambda
;;                      body                                body 2
;;


