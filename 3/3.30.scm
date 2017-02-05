(define (ripple-carry-adder a b s c)
  (let ((ck (make-wire))
	(if (null? (cdr a))
	    (set-signal! ck 0)
	    (ripple-carry-adder (cdr a) (cdr b) (cdr s) ck))
	(full-adder (car a) (car b) ck (cdr s) c))))

;; What is the delay needed to obtain the complete output from an n-bit ripple-carry adder, expressed in terms of the delays for and-gates, or-gates, and inverters?
;; We are recursing n times for n bits, each time doing a full-adder operation.
;; The full-adder is two half-adders and an or-gate.
;; The half-adder is two and-gate, one
;; or-gate and one inverter operation.
;; Total for half-adder: 4 delays.
;; Total for full-adder: 2 * (4 delays) + 1 = 9 delays
;; Total: 13 delays
