(define (problem office_problem_simple)
    (:domain office_domain_simple)
    (:objects
        famie - robot
        whoosh - robot
        wp1 wp2 wp3 - waypoint
    )
    (:init
        (robot_at famie wp1)
        (robot_at whoosh wp3)

        (= (distance wp1 wp2) 20) ; distance between wp1 and wp2 is 20 units
        (= (distance wp2 wp1) 15) ; distance between wp2 and wp1 is 15 units

        ; TRY THIS 
        ; (= (distance wp1 wp3) 15) ; distance between wp2 and wp1 is 15 units
        

    )
    
    ; EFFECT (at end (robot_at ?r ?to))
    
    (:goal
        (and (robot_at famie wp3) (robot_at whoosh wp1))
    )

)



;  ------------- RUNNN ------------------
;  SS


; for permissions
;  sudo chmod +x popf

; ../PDDL/popf assistant_domain.pddl assistant_problem1.pddl

;  FOR checking if OPTIMIZED
; ../PDDL/popf -n assistant_domain.pddl assistant_problem1.pddl



