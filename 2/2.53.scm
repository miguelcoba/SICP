(list 'a 'b 'c)
;Value 72: (a b c)

(list (list 'george))
;Value 73: ((george))

(cdr '((x1 x2) (y1 y2)))
;Value 74: ((y1 y2))

(pair? (car '(a short list)))
;Value: #f

(memq 'red '((red shoes) (blue socks)))
;Value: #f

(memq 'red '(red shoes blue socks))
;Value 75: (red shoes blue socks)

