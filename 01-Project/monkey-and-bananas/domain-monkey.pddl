;; logistics domain
;;
;; logistics-typed-length: strips + simple types
;;    based on logistics-strips-length.
;; 2019-05-07

(define (domain logistics-typed)
  (:requirements :strips :typing) 
  (:types MONKEY BOX BANANA TREE)
  (:predicates
        (at ?obj-or-monkey ?loc)
				(high ?obj-or-monkey)
				(low ?obj-or-monkey)
				(clear ?obj)			
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
)
