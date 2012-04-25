(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

(new-if (= 2 3) 0 5)

(new-if (= 1 1) 0 5)

(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
	  guess
	  (sqrt-iter (improve guess x)
		     x)))

; el procedimiento new-if no termina puesto que usa applicative-order y por
; tanto evalúa todos los argumentos antes de aplicar el procedimiento.
; Al evaluar el segundo argumento, se vuelve a llamar a sí misma, y por tanto
; nunca termina.