;; problem from monkey-and-banana project
;; 2019-05-08
(define (problem monkey-and-banana)
    (:domain logistics-typed)
    (:objects
        boxA - OBJECT
        boxB - OBJECT
        boxC - OBJECT
        person1 - PERSON
        person2 - PERSON
        position1 - LOCATION
        position2 - LOCATION
        position3 - LOCATION
        position4 - LOCATION
        position5 - LOCATION
        position6 - LOCATION
        position7 - LOCATION
        position8 - LOCATION
        position9 - LOCATION
        position10 - LOCATION
        position11 - LOCATION
        position12 - LOCATION
    )
    (:init
        (at person1 position2)
        (at person2 position6)
        (at boxA position11)
        (at boxB position7)
        (at boxC position7)
        (clear person1)
        (clear person2)
        (clear boxA)
        (clear boxC)
        (clear boxB)
    )
    (:goal 
        (and
            (at person1 position12)
            (at person2 position12)
            (at boxA position12)
            (at boxB position12)
            (at boxC position12)
            (on boxB boxC)
            (on boxA boxB)
        )
    )
)
