#!/bin/bash

# bash, too, uses the same concepts as any other scripting language. Below are arrays that hold information for outputs and also the 



#to run this file commands are listed at the end please go through each part of this scrpit first and make changes accordingly.

#this scrpits includes anlysis for RMSD, RMSF, Radius of gyration, inter helical angles , center of mass distance, 
a=( "systembd" "systembf" "systemdf") #this is the naming for directories of each protonation state (ie which one of the systems, for this - protonation states) 
#names in the above line should match the folder names of your system

for j in `seq 0 2` # loops through 3 system directories (change this number if you have more or less directories for example you have 5 directories the value goes for 0 to 4)
do 

cat > water_Bchain.tcl << EOF #water anlysis for each segment or chain 

mol new ${a[j]}/step5_assembly.xplor_ext.psf #include psf file for analysis
mol addfile ${a[j]}/step5_assembly.xplor_ext.pdb #include pdb file for analysis
mol addfile ${a[j]}/${a[j]}-all.dcd type dcd first 0 last -1 step 1 filebonds 1 autobonds 1 waitfor all #include the combinde dcd file from all trajectories including minimization step from CATDCD stuff 

package require pbctools
pbc wrap -centersel "protein" -center com -compound residue -all #wrapping the protein
set num_steps [molinfo 0 get numframes]
set sel [atomselect 0 "water and same residue as (within 5 of protein and segname PROB) and noh"] #make the selection for protein to calculate the water within 5 angstroms of the protein.
#set sel [atomselect 0 "water and same residue as (within 5 of protein and segname PROB) and not (within 6 of lipids) and noh"] #Use this notation if you have a lipid bilayer in your system.
set prob [atomselect 0 "protein and segname PROB and alpha"]
set refb [atomselect 0 "protein and segname PROB and alpha" frame 0]
for {set frame 0} {\$frame < \$num_steps} {incr frame} {
    \$pro frame \$frame
    \$sel frame \$frame
    \$sel update
    \$sel move [measure fit \$pro \$ref]
    for {set k -40} {\$k<41} {incr k} {
        set h(\$k) 0
    }
    set zcoor [\$sel get z]
    foreach Z \$zcoor {
        set k [expr "round(\$Z)"]
        if {\$k>=-40 && \$k<41} {
            incr h(\$k)
        }
    }
    for {set k -40} {\$k<41} {incr k} {
           puts -nonewline stderr "\$h(\$k) "
    }
    puts stderr ""
}
quit

EOF

cat > water_Dchain.tcl << EOF #water anlysis for each segment or chain 

mol new ${a[j]}/step5_assembly.xplor_ext.psf #include psf file for analysis
mol addfile ${a[j]}/step5_assembly.xplor_ext.pdb #include pdb file for analysis
mol addfile ${a[j]}/${a[j]}-all.dcd type dcd first 0 last -1 step 1 filebonds 1 autobonds 1 waitfor all #include the combinde dcd file from all trajectories including minimization step from CATDCD stuff 

package require pbctools
pbc wrap -centersel "protein" -center com -compound residue -all #wrapping the protein
set num_steps [molinfo 0 get numframes]
set sel [atomselect 0 "water and same residue as (within 5 of protein and segname PROD) and noh"] #make the selection for protein to calculate the water within 5 angstroms of the protein.
#set sel [atomselect 0 "water and same residue as (within 5 of protein and segname PROB) and not (within 6 of lipids) and noh"] #Use this notation if you have a lipid bilayer in your system.
set prob [atomselect 0 "protein and segname PROD and alpha"]
set refb [atomselect 0 "protein and segname PROD and alpha" frame 0]
for {set frame 0} {\$frame < \$num_steps} {incr frame} {
    \$pro frame \$frame
    \$sel frame \$frame
    \$sel update
    \$sel move [measure fit \$pro \$ref]
    for {set k -40} {\$k<41} {incr k} {
        set h(\$k) 0
    }
    set zcoor [\$sel get z]
    foreach Z \$zcoor {
        set k [expr "round(\$Z)"]
        if {\$k>=-40 && \$k<41} {
            incr h(\$k)
        }
    }
    for {set k -40} {\$k<41} {incr k} {
           puts -nonewline stderr "\$h(\$k) "
    }
    puts stderr ""
}
quit

EOF

cat > water_Fchain.tcl << EOF #water anlysis for each segment or chain 

mol new ${a[j]}/step5_assembly.xplor_ext.psf #include psf file for analysis
mol addfile ${a[j]}/step5_assembly.xplor_ext.pdb #include pdb file for analysis
mol addfile ${a[j]}/${a[j]}-all.dcd type dcd first 0 last -1 step 1 filebonds 1 autobonds 1 waitfor all #include the combinde dcd file from all trajectories including minimization step from CATDCD stuff 

package require pbctools
pbc wrap -centersel "protein" -center com -compound residue -all #wrapping the protein
set num_steps [molinfo 0 get numframes]
set sel [atomselect 0 "water and same residue as (within 5 of protein and segname PROF) and noh"] #make the selection for protein to calculate the water within 5 angstroms of the protein.
#set sel [atomselect 0 "water and same residue as (within 5 of protein and segname PROB) and not (within 6 of lipids) and noh"] #Use this notation if you have a lipid bilayer in your system.
set prob [atomselect 0 "protein and segname PROF and alpha"]
set refb [atomselect 0 "protein and segname PROF and alpha" frame 0]
for {set frame 0} {\$frame < \$num_steps} {incr frame} {
    \$pro frame \$frame
    \$sel frame \$frame
    \$sel update
    \$sel move [measure fit \$pro \$ref]
    for {set k -40} {\$k<41} {incr k} {
        set h(\$k) 0
    }
    set zcoor [\$sel get z]
    foreach Z \$zcoor {
        set k [expr "round(\$Z)"]
        if {\$k>=-40 && \$k<41} {
            incr h(\$k)
        }
    }
    for {set k -40} {\$k<41} {incr k} {
           puts -nonewline stderr "\$h(\$k) "
    }
    puts stderr ""
}
quit

EOF

vmd -dispdev text -e water_Bchain.tcl 2> ${a[j]}/water_Bchain.txt
vmd -dispdev text -e water_Dchain.tcl 2> ${a[j]}/water_Dchain.txt
vmd -dispdev text -e water_Fchain.tcl 2> ${a[j]}/water_Fchain.txt

done
done



#chmod a+x do_water.sh (this should be only done for once)

#./do_water.sh

# output of each analysis should be inside the respective folder of the system.

#following this script run please run 2awk.sh and 3awk.sh in order inside the folder where results of this analysis are generated
