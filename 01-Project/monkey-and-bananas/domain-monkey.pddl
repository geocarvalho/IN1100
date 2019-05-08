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
  (:action PICKUPTABLE
	:parameters
		(?obj - BLOCK
		 ?gripper - GRIPPER)
	:precondition
		(and    (empty ?gripper) 
			(clear ?obj)
			(ontable ?obj))
	:effect
   		(and 	(holding ?obj)
			(not (empty ?gripper)) 
			(not(clear ?obj))
			(not(ontable ?obj))))

  (:action PUTDOWN
	:parameters
		(?obj1 - BLOCK
		 ?obj2 - BLOCK
		 ?gripper - GRIPPER)
	:precondition
		(and    (holding ?obj1) 
			(clear ?obj2))
	:effect
		(and	(empty ?gripper)
			(on ?obj1 ?obj2)
			(clear ?obj1)
			(not (clear ?obj2)) 
			(not(holding ?obj1))))

  (:action PUTDOWNTABLE
	:parameters
		(?obj - BLOCK
		 ?gripper - GRIPPER)
	:precondition
		(and	(holding ?obj))
	:effect
		(and	(empty ?gripper)
			(ontable ?obj)
			(clear ?obj)
			(not (holding ?obj))))

)
