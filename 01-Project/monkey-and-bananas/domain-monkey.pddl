;; logistics domain
;;
;; logistics-typed-length: strips + simple types
;;    based on logistics-strips-length.
;; 2019-05-07

(define	(domain logistics-typed)
	(:requirements :strips :typing) 
	(:types ANIMAL OBJECT LOCATION FRUIT)
	(:predicates
        (at ?box-or-bananas-or-monkey ?loc)
        (on ?monkey ?box)
		(holding ?box-or-bananas ?monkey)
		(high ?monkey-or-bananas)
	)
	(:action GO
		:parameters
			(?monkey - ANIMAL
			?loc-from - LOCATION
			?loc-to - LOCATION)
		:precondition
			(and
				(at ?monkey ?loc-from)
				(not
				    (high ?monkey)
				)
			)
		:effect
			(and
				(at ?monkey ?loc-to)
				(not
					(at ?monkey ?loc-from)
				)
			)
	)
	(:action TAKE-BOX
	:parameters
		(?monkey - ANIMAL
		?box - OBJECT
		?loc - LOCATION)
	:precondition
		(and
		    (at ?monkey ?loc)
		    (at ?box ?loc)
		    (not
		        (high ?box)   
		    )
		)
	:effect
		(and
		    (holding ?box ?monkey)
		    (not
        	    (at ?box ?loc)
		    )
		)
	)
	(:action TAKE-FRUIT
	:parameters
		(?monkey - ANIMAL
		?bananas - FRUIT
		?loc - LOCATION)
	:precondition
		(and
		    (at ?monkey ?loc)
		    (at ?bananas ?loc)
		    (not
		        (high ?bananas)   
		    )
		    (not
		        (high ?monkey)
		    )
		)
	:effect
		(and
		    (holding ?bananas ?monkey)
		    (not
        	    (at ?bananas ?loc)
		    )
		)
	)
	(:action TAKE-OFF-BOX
	:parameters
		(?monkey - ANIMAL
		?box -  OBJECT
		?loc - LOCATION)
	:precondition
		(and
		    (at ?monkey ?loc)
		    (holding ?box ?monkey)
		)
	:effect
		(and
		    (at ?box ?loc)
		    (not
        	    (holding ?box ?monkey)
		    )
		)
	)
	(:action TAKE-OFF-FRUIT
	:parameters
		(?monkey - ANIMAL
		?bananas - FRUIT
		?loc - LOCATION)
	:precondition
		(and
		    (at ?monkey ?loc)
		    (holding ?bananas ?monkey)
		)
	:effect
		(and
		    (at ?bananas ?loc)
		    (not
        	    (holding ?bananas ?monkey)
		    )
		)
	)
	(:action CLIMB-BOX-DROP-BANANAS
	:parameters
		(?monkey - ANIMAL
		?box - OBJECT
		?bananas - FRUIT
		?loc - LOCATION)
	:precondition
		(and
		    (at ?monkey ?loc)
		    (at ?box ?loc)
		    (at ?bananas ?loc)
		)
	:effect
		(and
		    (on ?monkey ?box)
		    (high ?monkey)
		    (not
		        (high ?bananas)
		    )
		)
	)
	(:action GET-OFF-BOX
	:parameters
	    (?monkey - ANIMAL
	    ?box - OBJECT
	    ?loc - LOCATION)
	:precondition
	    (and
	        (at ?box ?loc)
	        (on ?monkey ?box)
	        (high ?monkey)
	    )
	:effect
	    (and
	        (at ?monkey ?loc)
	        (not
	            (on ?monkey ?box)
	        )
	        (not
	            (high ?monkey)
	        )
	    )
	)
)