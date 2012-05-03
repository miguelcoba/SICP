; a.
(define (cont-frac n d k)
  (define (iter k result)
    (if (= k 0)
	result
	(iter (- k 1) (/ (n k)(+ (d k) result)))))
  (iter k 0))

; 1/phi = 0.6180344478216819
(/ 1 (golden-ratio))
0.6180344478216819

; con k = 11 obtenemos una aproximación a 1/phi precisa a 4 decimales
(define (phi)
  (cont-frac (lambda (i) 1.0) (lambda (i) 1.0) 11))

(phi)
0.6180555555555556

; b. 
; cont-frac define un proceso iterativo.
; el proceso recursivo es
(define (cont-frac n d k)
  (if (= k 0)
      0
      (/ (n k) (+ (d k) (cont-frac n d (- k 1))))))
