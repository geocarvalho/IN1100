;; problem from monkey-and-banana project
;; 2019-05-08

(define (problem monkey-and-banana)
    (:domain logistics-typed)
    (:objects
        monkey - ANIMAL
        box - OBJECT
        bananas - OBJECT
        aposition - LOCATION
        bposition - LOCATION
        cposition - LOCATION
    )
    (:init
        (at monkey aposition)
        (at box bposition)
        (at bananas cposition)
        (high bananas)
    )
    (:goal 
        (and
            (at bananas aposition)
        )
    )
)
