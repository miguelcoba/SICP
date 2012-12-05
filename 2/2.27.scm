(define (deep-reverse l)
  (if (not (pair? l))
      l
      (append (deep-reverse (cdr l)) (list (deep-reverse (car l))))))
