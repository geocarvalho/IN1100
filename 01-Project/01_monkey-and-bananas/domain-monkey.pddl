;; problem from monkey-and-banana project
;; 2019-05-08

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
	; Move ANIMAL for LOCATION1 to LOCATION2
		:parameters
			(?monkey - ANIMAL
			?loc1 - LOCATION
			?loc2 - LOCATION)
		:precondition
			(and
				(at ?monkey ?loc1)
				(not (high ?monkey))
			)
		:effect
			(and
				(at ?monkey ?loc2)
				(not (at ?monkey ?loc1))
			)
	)
	(:action TAKE-LOW
	; Take OBJECT not high and can move with it
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
	; Take OBJECT in high positions and can move with it
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
	; Drop OBJECTs that are holding in low position
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
	; Climb OBJECT to get high position
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
	; Get down OBJECT to get low position
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
