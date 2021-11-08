mol new ../0-strip/glptp.ca.pdb
mol addfile ../0-strip/all.ca.dcd type dcd first 0 last -1 step 1 filebonds 1 autobonds 1 waitfor all

set num_steps [molinfo top get numframes]

set pro0 [atomselect top "resid 20 to 57 64 to 88 94 to 112 121 to 147 156 to 180 190 to 207 253 to 282 288 to 316 322 to 341 349 to 374 380 to 409 415 to 448" frame 0]
set pro [atomselect top "resid 20 to 57 64 to 88 94 to 112 121 to 147 156 to 180 190 to 207 253 to 282 288 to 316 322 to 341 349 to 374 380 to 409 415 to 448"]

set segA1 [atomselect top "(resid 20 to 46)"]
set segB1 [atomselect top "(resid 253 to 282)"]
set segA2 [atomselect top "(resid 64 to 88)"]
set segB2 [atomselect top "(resid 292 to 316)"]
set segA3 [atomselect top "(resid 94 to 112)"]
set segB3 [atomselect top "(resid 322 to 341)"]
set segA4 [atomselect top "(resid 121 to 147)"]
set segB4 [atomselect top "(resid 349 to 374)"]
set segA5 [atomselect top "(resid 153 to 180)"]
set segB5 [atomselect top "(resid 380 to 409)"]
set segA6 [atomselect top "(resid 190 to 207)"]
set segB6 [atomselect top "(resid 415 to 448)"]

for {set frame 1} {$frame < $num_steps} {incr frame} {

    $pro frame $frame
    $pro move [measure fit $pro $pro0]

    $segA1 frame $frame
    $segA2 frame $frame
    $segA3 frame $frame
    $segA4 frame $frame
    $segA5 frame $frame
    $segA6 frame $frame
    $segB1 frame $frame
    $segB2 frame $frame
    $segB3 frame $frame
    $segB4 frame $frame
    $segB5 frame $frame
    $segB6 frame $frame

    set theta1 [lindex [measure inertia $segA1] 1 2]
    set theta2 [lindex [measure inertia $segA2] 1 2]
    set theta3 [lindex [measure inertia $segA3] 1 2]
    set theta4 [lindex [measure inertia $segA4] 1 2]
    set theta5 [lindex [measure inertia $segA5] 1 2]
    set theta6 [lindex [measure inertia $segA6] 1 2]
    set theta7 [lindex [measure inertia $segB1] 1 2]
    set theta8 [lindex [measure inertia $segB2] 1 2]
    set theta9 [lindex [measure inertia $segB3] 1 2]
    set theta10 [lindex [measure inertia $segB4] 1 2]
    set theta11 [lindex [measure inertia $segB5] 1 2]
    set theta12 [lindex [measure inertia $segB6] 1 2]

    puts stderr "$theta1 $theta2 $theta3 $theta4 $theta5 $theta6 $theta7 $theta8 $theta9 $theta10 $theta11 $theta12"

}

quit

