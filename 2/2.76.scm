;; generic operations with explicit dispatch
to add new operations, each selector for each type should be added a new branch to select the correct behavior, each method requires a different method name

to add new types, the new type must be created with support for all existing methods in the system

;; data-directed style
to add new operations, a new method must be added for each type in the system

to add new types, all required methods must be implemented and added to the table

;; message-passing style
to add new operations, each existing constructor for each type must add a branch to the
dispatcher that represents the data object

to add new types, the new type must return a dispatcher that supports all the operations
existing currently in the system

;; Which organization would be most appropriate for a system in which new types must often be
;; added?
message-passing style or data-directed style

;; Which would be most appropriate for a system in which new operations must often be added?
data-directed style
