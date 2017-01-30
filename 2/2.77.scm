(define z (make-complex-from-real-imag 3 4))
;; get and put are not yet defined, but z would be ('complex ('rectangular '(3 4)))

(magnitude z)
(magnitude '(complex (rectangular (3 4))))
;; (define (magnitude z) (apply-generic 'magnitude z))
(apply-generic 'magnitude '(complex (rectangular (3 4))))


;; (define (apply-generic op . args)
;;  (let ((type-tags (map type-tag args)))
;;    (let ((proc (get op type-tags)))
;;      (if proc
;;          (apply proc (map contents args))
;;          (error
;;            "No method for these types -- APPLY-GENERIC"
;;            (list op type-tags))))))

;; (get 'magnitude 'complex) fails as there is no entry for that in the table
;; Alyssa suggestions fixes this

;; how many times is apply-generic called
;; one for 'magnitude and 'complex
;; one for 'magnitude and 'rectangular
;; that last one was applied to the (map contents args) of complex that is a 'rational tagged object

