;; problem from monkey-and-banana project
;; 2019-05-08

(define (problem monkey-and-banana)
    (:domain logistics-typed)
    (:objects
        monkey - MONKEY
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
        (low monkey)
    )
    (:goal 
        (and 
            (at monkey aposition)
            (at box cposition)
            (at bananas aposition)
            (low monkey)
            (low bananas)
        )
    )