;; By use of De Morgan's laws, an AND function is identical to an OR function with negated inputs and outputs. Likewise, an OR function is identical to an AND function with negated inputs and outputs

(define (or-gate a1 a2 output)
  (let ((not-a1 (make-wire))
	(not-a2 (make-wire))
	(and-output (make-wire)))
    (inverter a1 not-a1)
    (inverter a2 not-a2)
    (inverter and-output output)
    (and-gate not-a1 not-a2 and-output)))

;; the total delay is the delay of the inverters in the and-gate inputs plus the and-gate delay,
;; plus the delay of the inverter on the output of the and-gate
	
