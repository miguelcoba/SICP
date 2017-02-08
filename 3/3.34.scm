;; The problem is that it is wiring the same connector to both inputs of inner multiplier box.
;; This should work for the squarer when setting any of the inputs a or b, but as internally
;; it uses a multiplier that requires 2 of its 3 terminals to be set to calculate the last one,
;; the squarer will only work when setting the a terminal (this sets both m1 and m2 terminals on
;; the multiplier), but it won't work when setting the b terminal on the squarer, as this will
;; only set the p terminal on the multiplier and it can resolve the other two values
;;
;;        ---------
;;     --| m1      |  b
;;  a |  |    *  p |----- 
;;     --| m2      |
;;        ---------
