(define (cube x) (* x x x))
(define (p x) (- (* 3 x) (* 4 (cube x))))
(define (sine angle)
  (if (not (> (abs angle) 0.1))
      angle
      (p (sine (/ angle 3.0)))))

; a) p is applied 5 times
(sine 12.15)
(p (sine (/ 12.15 3.0)))
(p (sine 4.05))
(p (p (sine (/ 4.05 3.0))))
(p (p (sine 1.349999)))
(p (p (p (sine (/ 1.349999 3.0)))))
(p (p (p (sine 0.44999)))))
(p (p (p (p (sine (/ 0.44999 3.0))))))
(p (p (p (p (sine 0.15)))))
(p (p (p (p (p (sine (/ 0.15 3.0)))))))
(p (p (p (p (p (sine 0.05))))))
(p (p (p (p (p 0.05)))))
(p (p (p (p 0.1495))))
(p (p (p 0.435134)))
(p (p 0.97584))
(p -0.78956)
-0.39980

; b)
 Order of growth
  space: O(log a)
  steps: O(log a)
