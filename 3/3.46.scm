;; The problem with test-and-set! not being atomic is that two processes can start
;; executing the methods of the procedure at almost the same time
;; for example the first one could be pass the (car cell) procedure and reach the
;; (begin (set-car!...) part when is stopped to allow the second process to test the (car cell)
;; part. As the first process had no time to set it to true, the second process will also
;; be allowed to reach the (begin (set-car! ...) part and return the false value, thinking
;; it was allowed to acquire the mutex.
;; when the first procedure resumes execution, it will also return false and it too will
;; think it was allowed to acquire the mutex.
;; At this point, both process acquired the lock that is not the correct behavior of the mutex.
