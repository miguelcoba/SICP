(list 1 (list 2 (list 3 4)))

; result printed by the interpreter
(1 (2 (3 4)))

; box-and-pointer structure

(1 (2 (3 4))----->[ | ]------>[ |/]
                   |           |
                  [1]          | 
                               v (2 (3 4))   
                              [ | ]------->[ |/]
                               |            |
                              [2]           |
                                            |
                                            v (3 4)
                                           [ | ]----->[ |/]
                                            |          |
                                           [3]        [4]

; tree structure
                      (1 (2 (3 4)))
                           .
                          / \
                         1   .
                            / \
                           2   .
                              / \
                             3   4
