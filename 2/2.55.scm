(car ''abracadabra)

;; is seen by the interpreter as

(car (quote (quote abracadabra)))

;; or, a car of a list of two symbols

(car '(quote abracadabra))

;; and when evaluated the car of this list is the first symbol: quote
