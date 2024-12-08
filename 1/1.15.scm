(define (cube x) (* x x x))
(define (p x) (- (* 3 x) (* 4 (cube x))))
(define (sine angle)
  (if (not (> (abs angle) 0.1))
      angle
      (p (sine (/ angle 3.0)))))

;; a) p is applied 5 times
(sine 12.15)
(p (sine (/ 12.15 3.0)))
(p (sine 4.05))
(p (p (sine (/ 4.05 3.0))))
(p (p (sine 1.3499999999999999)))
(p (p (p (sine (/ 1.3499999999999999 3.0)))))
(p (p (p (sine .44999999999999996))))
(p (p (p (p (sine (/ .44999999999999996 3.0))))))
(p (p (p (p (sine .15)))))
(p (p (p (p (p (sine (/ .15 3.0)))))))
(p (p (p (p (p (sine 0.05))))))
(p (p (p (p (p 0.05)))))
(p (p (p (p .1495))))
(p (p (p .4351345505)))
(p (p .9758465331678772))
(p -.7895631144708228)
-.39980345741334

;; b) Order of growth.
;; steps: Each iteration the value of a is divided by 3. So, O(log[3] a)
;; space: space is linear to number of steps, therefore space is also O(log a)




