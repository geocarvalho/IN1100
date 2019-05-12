;; logistics domain
;;
;; logistics-typed-length: strips + simple types
;;    based on logistics-strips-length.
;; 2019-05-07

(define	(domain logistics-typed)
	(:requirements :strips :typing) 
	(:types PERSON OBJECT LOCATION)
	(:predicates
        (at ?box-or-human ?loc)
        (on ?box1 ?box2)
		(holding ?box ?human)
		(clear ?box)
	)
	(:action GO
		:parameters
			(?human - PERSON
			?loc-from - LOCATION
			?loc-to - LOCATION)
		:precondition
			(and
				(at ?human ?loc-from)
			)
		:effect
			(and
				(at ?human ?loc-to)
				(not
					(at ?human ?loc-from)
				)
			)
	)
	
	(:action TAKE-BOX
	:parameters
		(?human - PERSON
		?box - OBJECT
		?loc - LOCATION)
	:precondition
		(and
		    (at ?human ?loc)
		    (at ?box ?loc)
		    (clear ?box)
		    (clear ?human)
		)
	:effect
		(and
		    (holding ?box ?human)
		    (not
        	    (at ?box ?loc)
		    )
		    (not
		        (clear ?box)
		    )
		    (not
		        (clear ?human)
		    )
		)
	)
	
	(:action TAKE-OFF-BOX
	:parameters
		(?human - PERSON
		?box -  OBJECT
		?loc - LOCATION)
	:precondition
		(and
		    (at ?human ?loc)
		    (holding ?box ?human)
			(not
				(clear ?box)
			)
			(not
			    (clear ?human)
			)
		)
	:effect
		(and
		    (at ?box ?loc)
			(clear ?box)
			(clear ?human)
		    (not
        	    (holding ?box ?human)
		    )
		)
	)
	(:action PUT-BOX-ON
	:parameters
		(?human - PERSON
		?box1 - OBJECT
		?box2 - OBJECT
		?loc - LOCATION)
	:precondition
		(and
		    (at ?human ?loc)
		    (at ?box1 ?loc)
			(at ?box2 ?loc)
			(clear ?box1)
			(clear ?box2)
			(clear ?human)
		)
	:effect
		(and
		    (on ?box2 ?box1)
			(not
				(clear ?box1)
			)
		)
	)
	(:action GET-OFF-BOX
	:parameters
	    (?human - PERSON
	    ?box1 - OBJECT
		?box2 - OBJECT
	    ?loc - LOCATION)
	:precondition
	    (and
			(on ?box2 ?box1)
			(not
				(clear ?box2)
			)
	    )
	:effect
	    (and
	        (not
				(on ?box2 ?box1)
			)
			(at ?box2 ?loc)
			(clear ?box1)
			(clear ?box2)
	    )
	)
)
