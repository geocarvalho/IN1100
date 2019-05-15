;; logistics domain
;;
;; logistics-typed-length: strips + simple types
;;    based on logistics-strips-length.
;; 2019-05-07

(define	(domain logistics-typed)
	(:requirements :strips :typing) 
	(:types ANIMAL OBJECT LOCATION)
	(:predicates
        (at ?obj-or-monkey ?loc)
        (on ?monkey ?obj)
		(holding ?obj ?monkey)
		(high ?monkey-or-obj)
	)
	(:action GO
		:parameters
			(?monkey - ANIMAL
			?loc-from - LOCATION
			?loc-to - LOCATION)
		:precondition
			(and
				(at ?monkey ?loc-from)
				(not (high ?monkey))
			)
		:effect
			(and
				(at ?monkey ?loc-to)
				(not (at ?monkey ?loc-from))
			)
	)
	(:action TAKE-LOW
	:parameters
		(?monkey - ANIMAL
		?obj - OBJECT
		?loc - LOCATION)
	:precondition
		(and
		    (at ?monkey ?loc)
		    (at ?obj ?loc)
		    (not (high ?monkey))
		    (not (high ?obj))
		)
	:effect
		(and
		    (holding ?obj ?monkey)
		    (not (at ?obj ?loc))
		)
	)
	(:action TAKE-HIGH
	:parameters
		(?monkey - ANIMAL
		?obj - OBJECT
		?loc - LOCATION)
	:precondition
		(and
		    (at ?monkey ?loc)
		    (at ?obj ?loc)
		    (high ?obj)
		    (high ?monkey)
		)
	:effect
		(and
		    (holding ?obj ?monkey)
		    (not (at ?obj ?loc))
		)
	)
	(:action TAKE-OFF-LOW
	:parameters
		(?monkey - ANIMAL
		?obj -  OBJECT
		?loc - LOCATION)
	:precondition
		(and
		    (at ?monkey ?loc)
		    (holding ?obj ?monkey)
		)
	:effect
		(and
		    (at ?obj ?loc)
		    (not (holding ?obj ?monkey))
		    (not (high ?obj))
		)
	)
	(:action CLIMB
	:parameters
		(?monkey - ANIMAL
		?obj - OBJECT
		?loc - LOCATION)
	:precondition
		(and
		    (at ?monkey ?loc)
		    (at ?obj ?loc)
		    (not (high ?monkey))
		    (not (high ?obj))
		)
	:effect
		(and
		    (on ?monkey ?obj)
		    (high ?monkey)
		)
	)
	(:action GET-DOWN
	:parameters
	    (?monkey - ANIMAL
	    ?obj - OBJECT
	    ?loc - LOCATION)
	:precondition
	    (and
	        (at ?obj ?loc)
	        (at ?monkey ?loc)
	        (on ?monkey ?obj)
	        (high ?monkey)
	    )
	:effect
	    (and
	        (at ?monkey ?obj)
	        (not (on ?monkey ?obj))
	        (not (high ?monkey))
	    )
	)
)
