#!/bin/bash

J=1

cat > bend.tcl << EOF

mol new ../0-strip/glptpi2.ca.pdb
animate delete all
mol addfile ../0-strip/all.ca.dcd type dcd first 0 last -1 step 1 filebonds 1 autobonds 1 waitfor all

set all [atomselect top "all"]

set num_steps [molinfo top get numframes]
for {set frame 0} {\$frame < \$num_steps} {incr frame} {
	\$all frame \$frame
	set X [\$all get {x y z}]

	puts -nonewline stderr "\$frame"

	for {set i 0} {\$i < [expr [\$all num]-3]} {incr i} {
	    set A0 [lindex \$X \$i]
	    set A1 [lindex \$X [expr \$i+1]]
	    set A2 [lindex \$X [expr \$i+2]]
	    set A3 [lindex \$X [expr \$i+3]]
	    set M(0) [vecadd \$A0 \$A1 \$A2 \$A3]
	    set B [vecsub \$A2 \$A1]
	    set Bn [vecsub \$A1 \$A0]
	    set Bp [vecsub \$A3 \$A2]
	    set C [vecsub \$Bn \$B]
	    set C_ [vecsub \$B \$Bp]
	    set Z(0) [vecscale [veccross \$C \$C_] [expr 1/([veclength \$C]*[veclength \$C_])]]
	    if {[info exist Z(1)]} {
		set cosomega [vecdot \$Z(0) \$Z(1)]
		set DA [vecsub \$M(0) \$M(1)]
		set sinomega [expr [vecdot \$DA [veccross \$Z(0) \$Z(1)]]/[veclength \$DA]]
		set omega [expr 180*atan2(\$sinomega,\$cosomega)/acos(-1)]
		puts -nonewline stderr " \$omega"
	    }
	    set Z(1) \$Z(0)
	    set M(1) \$M(0)
	}
        puts stderr ""
    }
}
quit


EOF

vmd -dispdev text -e bend.tcl 2> bend.txt

