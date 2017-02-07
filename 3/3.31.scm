;; all the function boxes affect their outputs after a given delay after being called.
;; the after-delay procedure is the one that register the change in a given time in the future
;; in the agenda.
;; The add-action! on the wire is in fact the accept-action-procedure! in the make-wire
;; data procedure. If this doesn't call the action registered, this action will never
;; be registered in the agenda and the simulation won't do anything
