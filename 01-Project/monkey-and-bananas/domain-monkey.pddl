;; logistics domain
;;
;; logistics-typed-length: strips + simple types
;;    based on logistics-strips-length.
;; 2019-05-07

(define	(domain logistics-typed)
	(:requirements :strips :typing) 
	(:types ANIMAL OBJECT LOCATION FRUIT)
	(:predicates
        (at ?obj-or-monkey ?loc)
        (on ?monkey ?obj)
		(holding ?obj ?monkey)
		(high ?monkey-or-fruit)
	)
	(:action GO
		:parameters
			(?monkey - ANIMAL
			?loc-from - LOCATION
			?loc-to - LOCATION)
		:precondition
			(and
				(at ?monkey ?loc-from)
			)
		:effect
			(and
				(at ?monkey ?loc-to)
				(not
					(at ?monkey ?loc-from)
				)
			)
	)
	(:action TAKE-OBJ
	:parameters
		(?monkey - ANIMAL
		?obj - OBJECT
		?loc - LOCATION)
	:precondition
		(and
		    (at ?monkey ?loc)
		    (at ?obj ?loc)
		    (not
		        (high ?obj)   
		    )
		)
	:effect
		(and
		    (holding ?obj ?monkey)
		    (not
        	    (at ?obj ?loc)
		    )
		)
	)
	(:action TAKE-OFF-OBJ
	:parameters
		(?monkey - ANIMAL
		?obj - OBJECT
		?loc - LOCATION)
	:precondition
		(and
		    (at ?monkey ?loc)
		    (holding ?obj ?monkey)
		)
	:effect
		(and
		    (at ?obj ?loc)
		    (not
        	    (holding ?obj ?monkey)
		    )
		)
	)
	(:action CLIMB-OBJ
	:parameters
		(?monkey - ANIMAL
		?obj - OBJECT
		?fruit - FRUIT
		?loc - LOCATION)
	:precondition
		(and
		    (at ?monkey ?loc)
		    (at ?obj ?loc)
		    (at ?fruit ?loc)
		)
	:effect
		(and
		    (on ?monkey ?obj)
		    (high ?monkey)
		    (not
		        (high ?fruit)
		    )
		)
	)
)
