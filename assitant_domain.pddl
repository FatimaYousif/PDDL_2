; domain header

(define (domain office_domain_simple)

; move pick place give get

; move = GIVEN CODE


(:requirements :strips  :typing :fluents :disjunctive-preconditions :durative-actions )

(:types
    robot   ;more than 1 robot
    waypoint
    object
)

; FUNCTION
(:functions 
(distance ?wp1 ?wp2 - waypoint)
)


(:predicates
    (robot_at ?r - robot ?w - waypoint)
    (at ?obj - object ?w - waypoint)
    (holding ?r - robot ?obj - object)
    (handempty) 

    (not_occupied ?w - waypoint) ; check occupancy

)


; MOVE ACTION WITH DISTANCE
; same robot at the same place at the same time  - CHECK - TODO
; robot1 and robot2 shouldnt be going to the same place (waypoint)

(:durative-action move
    :parameters (?r - robot ?from - waypoint ?to - waypoint)
    :duration (= ?duration (distance ?from ?to))   ; NOT 10s duration = else otherwise all the time 10 will be returned
    :condition (and 
    (at start (robot_at ?r ?from))
    
    (at end (not_occupied ?to)) ; Check if the waypoint is not occupied

    )
    :effect (and
        (at start (not_occupied ?from)) ; whoosh left the place now  = ITS UN-OCCUPIED
        (at start (not (robot_at ?r ?from)))
        (at end (robot_at ?r ?to))
        (at end (not(not_occupied ?to ))  

    )

)



; ; PICK ACTION
; (:durative-action pick
;         :parameters (?r - robot ?obj - object ?from - waypoint)
;         :duration (= ?duration 5) ; picking for 5 units
;         :condition (and
;             (at start (robot_at ?r ?from))
;             (at start (at ?obj ?from))
;         )
;         :effect (and
;             (at start (not (at ?obj ?from)))
;             (at end (holding ?r ?obj))
;         )
;     )


; ; PLACE ACTION
; (:durative-action place
;         :parameters (?r - robot ?obj - object ?from - waypoint ?to - waypoint)
;         :duration (= ?duration 5) ; placing for 5 units
;         :condition (and
;             (at start(holding ?r ?obj))
;             (at start (robot_at ?r ?from))
;             )
;         :effect (and
;             (at start (not (robot_at ?r ?from)))
;             (at end (robot_at ?r ?to))
;             (at end (handempty))
;         )
;     )

; ; GIVE ACTION - TODO -----------------------
; (:durative-action place
;         :parameters (?r - robot ?obj - object ?from - waypoint ?to - waypoint)
;         :duration (= ?duration 5) ; giving for 5 units
;         :condition (and
;             (at start(holding ?r ?obj))
;             (at start (robot_at ?r ?from))
;             )
;         :effect (and
;             (at start (not (robot_at ?r ?from)))
;             (at end (handempty))
;         )
; )

; ; GET ACTION - TODO --------------------------
; (:durative-action place
;         :parameters (?r - robot ?obj - object ?from - waypoint ?to - waypoint)
;         :duration (= ?duration 5) ; getting for 5 units
;         :condition (and
;             (at start(holding ?r ?obj))
;             (at start (robot_at ?r ?from))
;             )
;         :effect (and
;             (at start (not (robot_at ?r ?from)))
;             (at end (handempty))
;         )
;     )


)
)
