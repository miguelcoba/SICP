;; this version is not efficient as it is returning a stream where the cdr refers
;; again to the procedure (sqrt-stream x).
;; As the cdr of the stream is optimized so that memo-proc remembers a value if it is
;; called again, this new version wont use the optimization as each time is called
;; a new procedure is passed to memo-proc and never is called again.

;; It would be similar to a (delay <proc) without the memo-proc optimization
