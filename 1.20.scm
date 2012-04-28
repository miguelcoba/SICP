(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

; Using normal-order evaluation
(gcd 206 40)
(= 40 0)
(gcd 40 
     (remainder 206 40))
(= (remainder 206 40) 0)
(= 6 0)
(gcd (remainder 206 40) 
     (remainder 40 (remainder 206 40)))
(= (remainder 40 (remainder 206 40)) 0)
(= (remainder 40 6) 0)
(= 4 0)
(gcd (remainder 40 (remainder 206 40))
     (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))
(= (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) 0)
(= (remainder 6 (remainder 40 6)) 0)
(= (remainder 6 4) 0)
(= 2 0)
(gcd (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
     (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))
(= (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))) 0)
(= (remainder (remainder 40 6) (remainder 6 (remainder 40 6))) 0)
(= (remainder 4 (remainder 6 4)) 0)
(= (remainder 4 2) 0)
(= 0 0)
(remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
(remainder 6 (remainder 40 6))
(remainder 6 4)
2
; remainder is performed 18 times



; Using applicative-order evaluation
(gcd 206 40)
(gcd 40 (remainder 206 40))
(gcd 40 6)
(gcd 6 (remainder 40 6))
(gcd 6 4)
(gcd 4 (remainder 6 4))
(gcd 4 2)
(gcd 2 (remainder 4 2))
(gcd 2 0)
2
; remainder is performed 4 times
