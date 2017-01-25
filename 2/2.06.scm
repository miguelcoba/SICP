(define zero (lambda (f) (lambda (x) x)))

(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))

; one
(define one (add-1 zero))
(define one (lambda (f) (lambda (x) (f ((zero f) x)))))
(define one (lambda (f) (lambda (x) (f (((lambda (f) (lambda (x) x)) f) x)))))
(define one (lambda (f) (lambda (x) (f ((lambda (x) x) x)))))
(define one (lambda (f) (lambda (x) (f x))))

; two
(define two (add-1 one))
(define two (lambda (f) (lambda (x) (f ((one f) x)))))
(define two (lambda (f) (lambda (x) (f (((lambda (g) (lambda (x) (g x))) f) x)))))
(define two (lambda (f) (lambda (x) (f ((lambda (x) (f x)) x)))))
(define two (lambda (f) (lambda (x) (f (f x)))))

; three
(define three (lambda (f) (lambda (x) (f (f (f x))))))

; add
; from http://en.wikipedia.org/wiki/Church_encoding
; The addition function plus(m,n) = m + n uses the identity f^(m+n)(x) = f^m(f^n(x))
; plus = m f (n f x)
(define (add a b)
  (lambda (f) (lambda (x) (a f) ((b f) x))))

; from http://www.billthelizard.com/2010/10/sicp-26-church-numerals.html

; Now we need to figure out how to add two Church numerals. We can see from the definition of add-1 that all it does is takes a Church numeral, n, and wraps one additional function call around it.

(define (add-1 n)
   (lambda (f) (lambda (x) (f ((n f) x)))))

; We can implement Church numeral addition by using the same approach. We'll take two Church numerals m and n. Instead of wrapping n in one extra function call, we'll wrap it in m extra calls.

(define (add m n)
   (lambda (f) (lambda (x) ((m f) ((n f) x)))))

; test
(define (inc x) (+ 1 x))

((zero inc) 0)
0
((zero inc) 1)
1
((zero inc) 2)
2

(define one (add-1 zero))
(define two (add-1 one))

((one inc) 0)
1
((one inc) 1)
2
((two inc) 0)
2
((two inc) 1)
3

(define one (lambda (f) (lambda (x) (f x))))
(define two (lambda (f) (lambda (x) (f (f x)))))

((one inc) 0)
1
((one inc) 5)
6
((two inc) 3)
5
((two inc) 7)


(define four (add two two))

((four inc) 0)
4