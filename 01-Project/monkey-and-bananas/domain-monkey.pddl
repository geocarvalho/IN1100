;; logistics domain
;;
;; logistics-typed-length: strips + simple types
;;    based on logistics-strips-length.
;; 2019-05-07

(define (domain logistics-typed)
  (:requirements :strips :typing) 
  (:types MONKEY OBJECT LOCATION)
  (:predicates
        (at ?obj-or-monkey ?loc)
				(on ?obj-or-monkey ?obj)
				(high ?obj-or-monkey)
				(clear ?obj)
				(holding ?obj)
	)
  (:action GO
		:parameters
			(?monkey - MONKEY
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
	(:action PICKUP
		:parameters
			(?monkey - MONKEY
			?box - OBJECT
			?loc - LOCATION
		:precondition
			(and
				(at ?monkey ?loc)
				(at ?box ?loc)
				(clear ?box)
				(not
					(holding ?box)
				)
			)
		:effect
			(and
				(holding ?box)
				(not
					(clear ?box)
				)
			)
	)
	(:action PUTDOWN
		:parameters
			(?monkey - MONKEY
			?box - OBJECT
			?loc - LOCATION)
		:precondition
			(and
				(at ?monkey ?loc)
				(holding ?box)
				(not
					(clear ?box)
				)
			)
		:effect
			(and
				(at ?box ?loc)
				(clear ?box)
				(not
					(holding ?obj)
				)
			)
	)
	(:action CLIMB
		:parameters
			(?monkey - MONKEY
			?box - OBJECT
			?loc - LOCATION)
		:precondition
			(and
				(at ?monkey ?loc)
				(at ?box ?loc)
				(clear ?box)
				(not 
					(high ?monkey)
				)
			)
		:effect
			(and
				(on ?monkey ?box)
				(high ?monkey)
				(not
					(clear ?box)
				)
			)
	)
	(:action TAKE-AND-GET-DOWN
		:parameters
			(?bananas - OBJECT
			?monkey - MONKEY
			?tree - OBJECT
			?loc - LOCATION)
		:precondition
			(and
				(at ?monkey ?loc)
				(at ?box ?loc)
				(at ?tree ?loc)
				(on ?monkey ?box)
				(high ?monkey)
				(on ?bananas ?tree)
				(high ?bananas)
			)
		:effect
			(and
				(holding bananas)
				(not
					(on ?monkey ?box)
					(on ?bananas ? tree)
					(high ?monkey)
					(high ?bananas)
				)
			)
	)
)
