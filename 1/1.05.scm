applicative-order evaluation
 This will evaluate arguments before applying the operator. The process of evaluating (p), will result in a infinite recursion trying to evaluate it.

  (test 0 (p))

  (test 0 (p))

  (test 0 (p))

normal-order evaluation
 This will not evaluate the operands until they are really needed. Instead will substitute operand expressions for parameters

  (test 0 (p))

  (if (= 0 0) 0 (p))

  (if #t 0 (p))

  0 
