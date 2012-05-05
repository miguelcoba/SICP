applicative-order evaluation
 Recursión infinita por la evaluación de los argumentos (particularmente (p)) antes de siquiera entrar al procedimiento (test)

  (test 0 (p))

  (test 0 (p))

  (test 0 (p))

normal-order evaluation

  (test 0 (p))

  (if (= 0 0) 0 (p))

  (if #t 0 (p))

  0 
