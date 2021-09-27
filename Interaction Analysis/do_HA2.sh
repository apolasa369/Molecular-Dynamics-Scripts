#!/bin/bash

# bash, too, uses the same concepts as any other scripting language. Below are arrays that hold information for outputs and also the 



#to run this file commands are listed at the end please go through each part of this scrpit first and make changes accordingly.

#this scrpits includes anlysis for RMSD, RMSF, Radius of gyration, inter helical angles , center of mass distance, 
a=( "systembd" "systembf" "systemdf") #this is the naming for directories of each protonation state (ie which one of the systems, for this - protonation states) 
#names in the above line should match the folder names of your system

for j in `seq 0 2` # loops through 3 system directories (change this number if you have more or less directories for example you have 5 directories the value goes for 0 to 4)
do 

cat > RMSD.tcl << EOF #writes a file for RMSD analysis 

mol new ${a[j]}/step5_assembly.xplor_ext.psf #include psf file for analysis
mol addfile ${a[j]}/step5_assembly.xplor_ext.pdb #include pdb file for analysis
mol addfile ${a[j]}/${a[j]}-all.dcd type dcd first 0 last -1 step 1 filebonds 1 autobonds 1 waitfor all #include the combinde dcd file from all trajectories including minimization step from CATDCD stuff 

source macros_HA2.tcl #create a macros file for your protein (more details on macros please go find on this following link https://www.ks.uiuc.edu/Training/SumSchool/materials/sources/tutorials/01-vmd-tutorial/html/node4.html#SECTION00042000000000000000) a sample macros file is included in here macros_HA2.tcl

set allprot [atomselect top "allprot"] #atom sections form macros file, should list all the selections required for respective analysis. 
set PROB1 [atomselect top "prob1"]
set PROF1 [atomselect top "prof1"]
set PROD1 [atomselect top "prod1"]
set BLOOP1 [atomselect top "bloop1"]
set FLOOP1 [atomselect top "floop1"]
set DLOOP1 [atomselect top "dloop1"]
set PROB2 [atomselect top "prob2"]
set PROF2 [atomselect top "prof2"]
set PROD2 [atomselect top "prod2"]
set BANDD [atomselect top "bandd"]
set BANDF [atomselect top "bandf"]
set DANDF [atomselect top "dandf"]
set BDLOOP [atomselect top "bdloop"]
set BFLOOP [atomselect top "bfloop"]
set DFLOOP [atomselect top "dfloop"]

set BXD [atomselect top "bxd"]
set BXF [atomselect top "bxf"]
set DXF [atomselect top "dxf"]
set HELICES [atomselect top "helices"]
set LOOPS [atomselect top "loops"]

set BPRO [atomselect top "bpro"]
set DPRO [atomselect top "dpro"]
set FPRO [atomselect top "fpro"]

set BLOOP2 [atomselect top "bloop2"]
set FLOOP2 [atomselect top "bloop2"]
set DLOOP2 [atomselect top "dloop2"]


set allR [atomselect top "all" frame 0 ] #include the respective reference (frame 0 which is pdb crystal structure) for each selection of above for rmsd calculation.

set PROB1R [atomselect top "prob1" frame 0 ] #include the respective reference (frame 0 which is pdb crystal structure) for each selection of above for rmsd calculation.
set PROF1R [atomselect top "prof1" frame 0 ]
set PROD1R [atomselect top "prod1" frame 0 ]
set BLOOP1R [atomselect top "bloop1" frame 0 ]
set FLOOP1R [atomselect top "floop1" frame 0 ]
set DLOOP1R [atomselect top "dloop1" frame 0 ]
set PROB2R [atomselect top "prob2" frame 0 ]
set PROF2R [atomselect top "prof2" frame 0 ]
set PROD2R [atomselect top "prod2" frame 0 ]
set BANDDR [atomselect top "bandd" frame 0 ]
set BANDFR [atomselect top "bandf" frame 0 ]
set DANDFR [atomselect top "dandf" frame 0 ]
set BDLOOPR [atomselect top "bdloop" frame 0 ]
set BFLOOPR [atomselect top "bfloop" frame 0 ]
set DFLOOPR [atomselect top "dfloop" frame 0 ]

set BXDR [atomselect top "bxd" frame 0 ]
set BXFR [atomselect top "bxf" frame 0 ]
set DXFR [atomselect top "dxf" frame 0 ]
set HELICESR [atomselect top "helices" frame 0 ]
set LOOPSR [atomselect top "loops" frame 0 ]

set BPROR [atomselect top "bpro" frame 0 ]
set DPROR [atomselect top "dpro" frame 0 ]
set FPROR [atomselect top "fpro" frame 0 ]

set BLOOP2R [atomselect top "bloop2" frame 0 ]
set FLOOP2R [atomselect top "bloop2" frame 0 ]
set DLOOP2R [atomselect top "dloop2" frame 0 ]


set num_steps [molinfo 0 get numframes] #calculates the number of frames inthe trajectory 
for {set frame 1} {\$frame < \$num_steps} {incr frame} { #loops through each frame from 0 to n for measuring the analysis
    \$allpro frame \$frame
    \$PROB1 \$frame
    \$PROF1 \$frame
    \$PROD1 \$frame 
    
    \$BLOOP1 \$frame
    \$FLOOP1 \$frame
    \$DLOOP1 \$frame
    
    \$PROB2 \$frame
    \$PROF2 \$frame
    \$PROD2 \$frame
    
    \$BLOOP2 \$frame
    \$FLOOP2 \$frame
    \$DLOOP2 \$frame
    
    \$BANDD \$frame
    \$BANDF \$frame
    \$DANDF \$frame
    
    \$BDLOOP \$frame
    \$BFLOOP \$frame
    \$DFLOOP \$frame
    
    \$BXD \$frame
    \$BXF \$frame
    \$DXF \$frame
    
    \$HELICES \$frmae
    \$LOOPS \$frame
    \$BPRO \$frame
    \$DPRO \$frame
    \$FPRO \$frame
    \$BDLOOP \$frame
    \$BFLOOP \$frame
    \$DFLOOP \$frame




    set trans [measure fit \$allpro  \$allR] #alignment of protein with intial structure
    \$allpro move \$trans
    set rmsdh1 [measure rmsd \$allpro \$allR] #calculation of rmsd with respective to intial structure
    #
    set trans [measure fit \$PROB1 \$PROB1R]
    \$allpro move \$trans
    set rmsdh2 [measure rmsd \$PROB1 \$PROB1R]
    #
    set trans [measure fit \$PROD1 \$PROD1R]
    \$allpro move \$trans
    set rmsdh3 [measure rmsd \$PROD1 \$PROD1R]
    #
    set trans [measure fit \$PROF1 \$PROF1R]
    \$allpro move \$trans
    set rmsdh4 [measure rmsd \$PROF1 \$PROF1R]
    #
    set trans [measure fit \$BLOOP1 \$BLOOP1R]
    \$allpro move \$trans
    set rmsdh5 [measure rmsd \$BLOOP1 \$BLOOP1R]
    #
    set trans [measure fit \$DLOOP1 \$DLOOP1R]
    \$allpro move \$trans
    set rmsdh6 [measure rmsd \$DLOOP1 \$DLOOP1R]
    #
    set trans [measure fit \$FLOOP1 \$FLOOP1R]
    \$allpro move \$trans
    set rmsdh7 [measure rmsd \$FLOOP1 \$FLOOP1R]
    #
    set trans [measure fit \$PROB2 \$PROB2R]
    \$allpro move \$trans
    set rmsdh8 [measure rmsd \$PROB2 \$PROB2R]
    #
    set trans [measure fit \$PROD2 \$PROD2R]
    \$allpro move \$trans
    set rmsdh9 [measure rmsd \$PROD2 \$PROD2R]
    #
    set trans [measure fit \$PROF2 \$PROF2R]
    \$allpro move \$trans
    set rmsdh10 [measure rmsd \$PROF2 \$PROF2R]
    #
    set trans [measure fit \$BLOOP2 \$BLOOP2R]
    \$allpro move \$trans
    set rmsdh11 [measure rmsd \$BLOOP2 \$BLOOP2R]
    #
    set trans [measure fit \$DLOOP2 \$DLOOP2R]
    \$allpro move \$trans
    set rmsdh12 [measure rmsd \$DLOOP2 \$DLOOP2R]
    #
    set trans [measure fit \$FLOOP2 \$FLOOP2R]
    \$allpro move \$trans
    set rmsdh13 [measure rmsd \$FLOOP2 \$FLOOP2R]
    #
    set trans [measure fit \$BANDD \$BANDDR]
    \$allpro move \$trans
    set rmsdh14 [measure rmsd  \$BANDD \$BANDDR]
    #
    set trans [measure fit \$BANDF \$BANDFR]
    \$allpro move \$trans
    set rmsdh15 [measure rmsd  \$BANDF \$BANDFR]
    #
    set trans [measure fit \$DANDF \$DANDFR]
    \$allpro move \$trans
    set rmsdh16 [measure rmsd  \$DANDF \$DANDFR]
 #
    set trans [measure fit \$BDLOOP \$BDLOOPR]
    \$allpro move \$trans
    set rmsdh17 [measure rmsd \$BDLOOP \$BDLOOPR]
    #
    set trans [measure fit \$BFLOOP \$BFLOOPR]
    \$allpro move \$trans
    set rmsdh18 [measure rmsd \$BFLOOP \$BFLOOPR]
    #
    set trans [measure fit \$DFLOOP \$DFLOOPR]
    \$allpro move \$trans
    set rmsdh19 [measure rmsd \$DFLOOP \$DFLOOPR]
    #
    set trans [measure fit \$BXD \$BXDR]
    \$allpro move \$trans
    set rmsdh20 [measure rmsd \$BXD \$BXDR]
    #
    set trans [measure fit \$BXF \$BXFR]
    \$allpro move \$trans
    set rmsdh21 [measure rmsd \$BXF \$BXFR]
    #
    set trans [measure fit \$DXF \$DXFR]
    \$allpro move \$trans
    set rmsdh22 [measure rmsd \$DXF \$DXFR]
    #
    set trans [measure fit \$HELICES \$HELICESR]
    \$allpro move \$trans
    set rmsdh23 [measure rmsd \$HELICES \$HELICESR]
    #
    set trans [measure fit \$LOOPS \$LOOPSR]
    \$allpro move \$trans
    set rmsdh24 [measure rmsd \$LOOPS \$LOOPSR]
    #
    set trans [measure fit \$BPRO \$BPROR]
    \$allpro move \$trans
    set rmsdh25 [measure rmsd \$BPRO \$BPROR]
    #
    set trans [measure fit \$DPRO \$DPROR]
    \$allpro move \$trans
    set rmsdh26 [measure rmsd \$DPRO \$DPROR]
    #
    set trans [measure fit \$FPRO \$FPROR]
    \$allpro move \$trans
    set rmsdh27 [measure rmsd \$FPRO \$FPROR]
    #
    set trans [measure fit \$BDLOOP \$BDLOOPR]
    \$allpro move \$trans
    set rmsdh28 [measure rmsd \$BDLOOP \$BDLOOPR]
    #
    set trans [measure fit \$BFLOOP \$BFLOOPR]
    \$allpro move \$trans
    set rmsdh29 [measure rmsd \$BFLOOP1 \$BFLOOPR]
    #
    set trans [measure fit \$DFLOOP \$DFLOOPR]
    \$allpro move \$trans
    set rmsdh30 [measure rmsd \$DFLOOP \$DFLOOPR] 

     puts stderr "\$frame \$rmsdh1 \$rmsdh2 \$rmsdh3 \$rmsdh4 \$rmsdh5 \$rmsdh6 \$rmsdh7 \$rmsdh8 \$rmsdh9 \$rmsdh10 \$rmsdh11 \$rmsdh12 \$rmsdh13 \$rmsdh14 \$rmsdh15 \$rmsdh16 \$rmsdh17 \$rmsdh18 \$rmsdh19 \$rmsdh20 \$rmsdh21 \$rmsdh22 \$rmsdh23 \$rmsdh24 \$rmsdh25 \$rmsdh26 \$rmsdh27 \$rmsdh28 \$rmsdh29 \$rmsdh30" # prints the value of each caluction from above part and prints in order (colum 0 = frame number number, colum 1 = values of rmsh1 ......) 
}

quit
EOF

cat > RMSF_Bpro.tcl << EOF #Writes a RMSF scrpits for a single chain/segment you can combine this scrpit if you have one segment/chain in the system 

mol new ${a[j]}/step5_assembly.xplor_ext.psf
mol addfile ${a[j]}/step5_assembly.xplor_ext.pdb
mol addfile ${a[j]}/${a[j]}-all.dcd type dcd first 0 last -1 step 1 filebonds 1 autobonds 1 waitfor all

source macros_HA2.tcl

set all [atomselect top "allprot"]
set sel0 [\$all num]
set sel [atomselect top "bpro"]
set ref [atomselect top "bpro" frame 0]

set num_steps [molinfo 0 get numframes]
for {set frame 0} {\$frame < \$num_steps} {incr frame} {
    \$all frame \$frame
    \$sel frame \$frame

set trans [measure fit \$sel \$ref]
\$all move \$trans
}

for {set i 0} {\$i < [\$sel num]} {incr i} { 
#     set rmsf [measure rmsf \$sel first 0 last -1 step 5] 
     set rmsf [measure rmsf \$sel first 0 last -1] 
     puts stderr "[expr {\$i+1}] \t [lindex \$rmsf \$i]" #prints overall RMSF for each residue in the chain/segment
} 

quit
EOF

cat > RMSF_Dpro.tcl << EOF

mol new ${a[j]}/step5_assembly.xplor_ext.psf
mol addfile ${a[j]}/step5_assembly.xplor_ext.pdb
mol addfile ${a[j]}/${a[j]}-all.dcd type dcd first 0 last -1 step 1 filebonds 1 autobonds 1 waitfor all

source macros_HA2.tcl

set all [atomselect top "allprot"]
set sel0 [\$all num]
set sel [atomselect top "dpro"]
set ref [atomselect top "dpro" frame 0]

set num_steps [molinfo 0 get numframes]
for {set frame 0} {\$frame < \$num_steps} {incr frame} {
    \$all frame \$frame
    \$sel frame \$frame

set trans [measure fit \$sel \$ref]
\$all move \$trans
}

for {set i 0} {\$i < [\$sel num]} {incr i} { 
#     set rmsf [measure rmsf \$sel first 0 last -1 step 5] 
     set rmsf [measure rmsf \$sel first 0 last -1] 
     puts stderr "[expr {\$i+1}] \t [lindex \$rmsf \$i]" 
} 

quit
EOF

cat > RMSF_Fpro.tcl << EOF

mol new ${a[j]}/step5_assembly.xplor_ext.psf
mol addfile ${a[j]}/step5_assembly.xplor_ext.pdb
mol addfile ${a[j]}/${a[j]}-all.dcd type dcd first 0 last -1 step 1 filebonds 1 autobonds 1 waitfor all

source macros_HA2.tcl

set all [atomselect top "allprot"]
set sel0 [\$all num]
set sel [atomselect top "fpro"]
set ref [atomselect top "fpro" frame 0]

set num_steps [molinfo 0 get numframes]
for {set frame 0} {\$frame < \$num_steps} {incr frame} {
    \$all frame \$frame
    \$sel frame \$frame

set trans [measure fit \$sel \$ref]
\$all move \$trans
}

for {set i 0} {\$i < [\$sel num]} {incr i} { 
#     set rmsf [measure rmsf \$sel first 0 last -1 step 5] 
     set rmsf [measure rmsf \$sel first 0 last -1] 
     puts stderr "[expr {\$i+1}] \t [lindex \$rmsf \$i]" 
} 

quit
EOF


cat > ${a[j]}/HBOND.tcl << EOF #overal hydrogen bond distance anlysis (measures the hydrogen bond distance between donor and acceptors involved in the bonding)

mol new ${a[j]}/step5_assembly.xplor_ext.psf
mol addfile ${a[j]}/step5_assembly.xplor_ext.pdb
mol addfile ${a[j]}/${a[j]}-all.dcd type dcd first 0 last -1 step 1 filebonds 1 autobonds 1 waitfor all

package require hbonds 1.2 

hbonds -sel1 [atomselect 0 "protein"]  -dist 4.0 -ang 30 -writefile yes  -detailout yes  #descrpiton of this selection are listed in following website https://www.ks.uiuc.edu/Research/vmd/plugins/hbonds/ (based on your criteria you can change the setting on this line)

quit
EOF

cat > inter_helang.tcl << EOF

mol new ${a[j]}/step5_assembly.xplor_ext.psf
mol addfile ${a[j]}/step5_assembly.xplor_ext.pdb
mol addfile ${a[j]}/${a[j]}-all.dcd type dcd first 0 last -1 step 1 filebonds 1 autobonds 1 waitfor all

source macros_HA2.tcl

set allprot [atomselect top "allprot"]


set BPRO [atomselect top "bpro"]
set DPRO [atomselect top "dpro"]
set FPRO [atomselect top "fpro"]


set allR [atomselect top "all" frame 0 ]

set BPROR [atomselect top "bpro" frame 0 ]
set DPROR [atomselect top "dpro" frame 0 ]
set FPROR [atomselect top "fpro" frame 0 ]



set num_steps [molinfo 0 get numframes]
for {set frame 1} {\$frame < \$num_steps} {incr frame} {
    \$allpro frame \$frame
    \$BPRO \$frame
    \$DPRO \$frame
    \$FPRO \$frame

#
    set h1h2 [expr 180*(acos([vecdot [lindex [measure inertia \$BPRO] 1 2] [lindex [measure inertia \$DPRO] 1 2]]))/acos(-1)] #calculates the angles between helix B and helix D 
    if {\$h1h2 > 90} {set h1h2 [expr 180-\$h1h2]}
    set h1h3 [expr 180*(acos([vecdot [lindex [measure inertia \$BPRO] 1 2] [lindex [measure inertia \$FPRO] 1 2]]))/acos(-1)]  #calculates the angles between helix B and helix F
    if {\$h1h3 > 90} {set h1h3 [expr 180-\$h1h3]}
#
    set h2h3 [expr 180*(acos([vecdot [lindex [measure inertia \$DPRO] 1 2] [lindex [measure inertia \$FPRO] 1 2]]))/acos(-1)] #calculates the angles between helix D and helix F (include more lines for each helix combination for your protein this script is for a 3 helical system)
    if {\$h2h3 > 90} {set h2h3 [expr 180-\$h2h3]}

#
    puts stderr "\$frame \$h1h2 \$h1h3 \$h2h3"
}

quit
EOF

cat > xcom_helices.tcl << EOF

mol new ${a[j]}/step5_assembly.xplor_ext.psf
mol addfile ${a[j]}/step5_assembly.xplor_ext.pdb
mol addfile ${a[j]}/${a[j]}-all.dcd type dcd first 0 last -1 step 1 filebonds 1 autobonds 1 waitfor all

source macros_HA2.tcl

set allprot [atomselect top "allprot"]


set BPRO [atomselect top "bpro"]
set DPRO [atomselect top "dpro"]
set FPRO [atomselect top "fpro"]


set allR [atomselect top "all" frame 0 ]

set BPROR [atomselect top "bpro" frame 0 ]
set DPROR [atomselect top "dpro" frame 0 ]
set FPROR [atomselect top "fpro" frame 0 ]



set num_steps [molinfo 0 get numframes]
for {set frame 1} {\$frame < \$num_steps} {incr frame} {
    \$allpro frame \$frame
    \$BPRO \$frame
    \$DPRO \$frame
    \$FPRO \$frame
    set  comxh1  [ lindex [measure center \$BPRO] 0] #calculates the center of mass distance of helix B from protein center of mass
    set  comxh2  [ lindex [measure center \$DPRO] 0]
    set  comxh3  [ lindex [measure center \$FPRO] 0]
     puts stderr "\$frame \$comxh1 \$comxh2 \$comxh3"
}

quit
EOF

cat > ${a[j]}/salt.tcl << EOF

mol new ${a[j]}/step5_assembly.xplor_ext.psf
mol addfile ${a[j]}/step5_assembly.xplor_ext.pdb
mol addfile ${a[j]}/${a[j]}-all.dcd type dcd first 0 last -1 step 1 filebonds 1 autobonds 1 waitfor all

package require saltbr 1.1 

saltbr -sel [atomselect 0 "protein"] #identify and outputs each saltbridge formed in the simulation of protein. prints the minimum distance for each frame between salt bridge residue pairs indiviualy


quit
EOF


cat > rgyr.tcl << EOF

mol new ${a[j]}/step5_assembly.xplor_ext.psf
mol addfile ${a[j]}/step5_assembly.xplor_ext.pdb
mol addfile ${a[j]}/${a[j]}-all.dcd type dcd first 0 last -1 step 1 filebonds 1 autobonds 1 waitfor all

source macros_HA2.tcl

set allprot [atomselect top "allprot"]
set PROB1 [atomselect top "prob1"]
set PROF1 [atomselect top "prof1"]
set PROD1 [atomselect top "prod1"]
set BLOOP1 [atomselect top "bloop1"]
set FLOOP1 [atomselect top "floop1"]
set DLOOP1 [atomselect top "dloop1"]
set PROB2 [atomselect top "prob2"]
set PROF2 [atomselect top "prof2"]
set PROD2 [atomselect top "prod2"]
set BANDD [atomselect top "bandd"]
set BANDF [atomselect top "bandf"]
set DANDF [atomselect top "dandf"]
set BDLOOP [atomselect top "bdloop"]
set BFLOOP [atomselect top "bfloop"]
set DFLOOP [atomselect top "dfloop"]

set BXD [atomselect top "bxd"]
set BXF [atomselect top "bxf"]
set DXF [atomselect top "dxf"]
set HELICES [atomselect top "helices"]
set LOOPS [atomselect top "loops"]

set BPRO [atomselect top "bpro"]
set DPRO [atomselect top "dpro"]
set FPRO [atomselect top "fpro"]

set BLOOP2 [atomselect top "bloop2"]
set FLOOP2 [atomselect top "bloop2"]
set DLOOP2 [atomselect top "dloop2"]


set allR [atomselect top "all" frame 0 ]

set PROB1R [atomselect top "prob1" frame 0 ]
set PROF1R [atomselect top "prof1" frame 0 ]
set PROD1R [atomselect top "prod1" frame 0 ]
set BLOOP1R [atomselect top "bloop1" frame 0 ]
set FLOOP1R [atomselect top "floop1" frame 0 ]
set DLOOP1R [atomselect top "dloop1" frame 0 ]
set PROB2R [atomselect top "prob2" frame 0 ]
set PROF2R [atomselect top "prof2" frame 0 ]
set PROD2R [atomselect top "prod2" frame 0 ]
set BANDDR [atomselect top "bandd" frame 0 ]
set BANDFR [atomselect top "bandf" frame 0 ]
set DANDFR [atomselect top "dandf" frame 0 ]
set BDLOOPR [atomselect top "bdloop" frame 0 ]
set BFLOOPR [atomselect top "bfloop" frame 0 ]
set DFLOOPR [atomselect top "dfloop" frame 0 ]

set BXDR [atomselect top "bxd" frame 0 ]
set BXFR [atomselect top "bxf" frame 0 ]
set DXFR [atomselect top "dxf" frame 0 ]
set HELICESR [atomselect top "helices" frame 0 ]
set LOOPSR [atomselect top "loops" frame 0 ]

set BPROR [atomselect top "bpro" frame 0 ]
set DPROR [atomselect top "dpro" frame 0 ]
set FPROR [atomselect top "fpro" frame 0 ]

set BLOOP2R [atomselect top "bloop2" frame 0 ]
set FLOOP2R [atomselect top "bloop2" frame 0 ]
set DLOOP2R [atomselect top "dloop2" frame 0 ]


set num_steps [molinfo 0 get numframes]
for {set frame 1} {\$frame < \$num_steps} {incr frame} {
    \$allpro frame \$frame
    \$PROB1 \$frame
    \$PROF1 \$frame
    \$PROD1 \$frame
    
    \$BLOOP1 \$frame
    \$FLOOP1 \$frame
    \$DLOOP1 \$frame
    
    \$PROB2 \$frame
    \$PROF2 \$frame
    \$PROD2 \$frame
    
    \$BLOOP2 \$frame
    \$FLOOP2 \$frame
    \$DLOOP2 \$frame
    
    \$BANDD \$frame
    \$BANDF \$frame
    \$DANDF \$frame
    
    \$BDLOOP \$frame
    \$BFLOOP \$frame
    \$DFLOOP \$frame
    
    \$BXD \$frame
    \$BXF \$frame
    \$DXF \$frame
    
    \$HELICES \$frmae
    \$LOOPS \$frame
    \$BPRO \$frame
    \$DPRO \$frame
    \$FPRO \$frame
    \$BDLOOP \$frame
    \$BFLOOP \$frame
    \$DFLOOP \$frame




    set trans [measure fit \$allpro  \$allR]
    \$allpro move \$trans
    set rgyrh1 [measure rgyr \$allpro \$allR]
    #
    set trans [measure fit \$PROB1 \$PROB1R]
    \$allpro move \$trans
    set rgyrh2 [measure rgyr \$PROB1 \$PROB1R]
    #
    set trans [measure fit \$PROD1 \$PROD1R]
    \$allpro move \$trans
    set rgyrh3 [measure rgyr \$PROD1 \$PROD1R]
    #
    set trans [measure fit \$PROF1 \$PROF1R]
    \$allpro move \$trans
    set rgyrh4 [measure rgyr \$PROF1 \$PROF1R]
    #
    set trans [measure fit \$BLOOP1 \$BLOOP1R]
    \$allpro move \$trans
    set rgyrh5 [measure rgyr \$BLOOP1 \$BLOOP1R]
    #
    set trans [measure fit \$DLOOP1 \$DLOOP1R]
    \$allpro move \$trans
    set rgyrh6 [measure rgyr \$DLOOP1 \$DLOOP1R]
    #
    set trans [measure fit \$FLOOP1 \$FLOOP1R]
    \$allpro move \$trans
    set rgyrh7 [measure rgyr \$FLOOP1 \$FLOOP1R]
    #
    set trans [measure fit \$PROB2 \$PROB2R]
    \$allpro move \$trans
    set rgyrh8 [measure rgyr \$PROB2 \$PROB2R]
    #
    set trans [measure fit \$PROD2 \$PROD2R]
    \$allpro move \$trans
    set rgyrh9 [measure rgyr \$PROD2 \$PROD2R]
    #
    set trans [measure fit \$PROF2 \$PROF2R]
    \$allpro move \$trans
    set rgyrh10 [measure rgyr \$PROF2 \$PROF2R]
    #
    set trans [measure fit \$BLOOP2 \$BLOOP2R]
    \$allpro move \$trans
    set rgyrh11 [measure rgyr \$BLOOP2 \$BLOOP2R]
    #
    set trans [measure fit \$DLOOP2 \$DLOOP2R]
    \$allpro move \$trans
    set rgyrh12 [measure rgyr \$DLOOP2 \$DLOOP2R]
    #
    set trans [measure fit \$FLOOP2 \$FLOOP2R]
    \$allpro move \$trans
    set rgyrh13 [measure rgyr \$FLOOP2 \$FLOOP2R]
    #
    set trans [measure fit \$BANDD \$BANDDR]
    \$allpro move \$trans
    set rgyrh14 [measure rgyr  \$BANDD \$BANDDR]
    #
    set trans [measure fit \$BANDF \$BANDFR]
    \$allpro move \$trans
    set rgyrh15 [measure rgyr  \$BANDF \$BANDFR]
    #
    set trans [measure fit \$DANDF \$DANDFR]
    \$allpro move \$trans
    set rgyrh16 [measure rgyr  \$DANDF \$DANDFR]
 #
    set trans [measure fit \$BDLOOP \$BDLOOPR]
    \$allpro move \$trans
    set rgyrh17 [measure rgyr \$BDLOOP \$BDLOOPR]
    #
    set trans [measure fit \$BFLOOP \$BFLOOPR]
    \$allpro move \$trans
    set rgyrh18 [measure rgyr \$BFLOOP \$BFLOOPR]
    #
    set trans [measure fit \$DFLOOP \$DFLOOPR]
    \$allpro move \$trans
    set rgyrh19 [measure rgyr \$DFLOOP \$DFLOOPR]
    #
    set trans [measure fit \$BXD \$BXDR]
    \$allpro move \$trans
    set rgyrh20 [measure rgyr \$BXD \$BXDR]
    #
    set trans [measure fit \$BXF \$BXFR]
    \$allpro move \$trans
    set rgyrh21 [measure rgyr \$BXF \$BXFR]
    #
    set trans [measure fit \$DXF \$DXFR]
    \$allpro move \$trans
    set rgyrh22 [measure rgyr \$DXF \$DXFR]
    #
    set trans [measure fit \$HELICES \$HELICESR]
    \$allpro move \$trans
    set rgyrh23 [measure rgyr \$HELICES \$HELICESR]
    #
    set trans [measure fit \$LOOPS \$LOOPSR]
    \$allpro move \$trans
    set rgyrh24 [measure rgyr \$LOOPS \$LOOPSR]
    #
    set trans [measure fit \$BPRO \$BPROR]
    \$allpro move \$trans
    set rgyrh25 [measure rgyr \$BPRO \$BPROR]
    #
    set trans [measure fit \$DPRO \$DPROR]
    \$allpro move \$trans
    set rgyrh26 [measure rgyr \$DPRO \$DPROR]
    #
    set trans [measure fit \$FPRO \$FPROR]
    \$allpro move \$trans
    set rgyrh27 [measure rgyr \$FPRO \$FPROR]
    #
    set trans [measure fit \$BDLOOP \$BDLOOPR]
    \$allpro move \$trans
    set rgyrh28 [measure rgyr \$BDLOOP \$BDLOOPR]
    #
    set trans [measure fit \$BFLOOP \$BFLOOPR]
    \$allpro move \$trans
    set rgyrh29 [measure rgyr \$BFLOOP1 \$BFLOOPR]
    #
    set trans [measure fit \$DFLOOP \$DFLOOPR]
    \$allpro move \$trans
    set rgyrh30 [measure rgyr \$DFLOOP \$DFLOOPR] 

     puts stderr "\$frame \$rgyrh1 \$rgyrh2 \$rgyrh3 \$rgyrh4 \$rgyrh5 \$rgyrh6 \$rgyrh7 \$rgyrh8 \$rgyrh9 \$rgyrh10 \$rgyrh11 \$rgyrh12 \$rgyrh13 \$rgyrh14 \$rgyrh15 \$rgyrh16 \$rgyrh17 \$rgyrh18 \$rgyrh19 \$rgyrh20 \$rgyrh21 \$rgyrh22 \$rgyrh23 \$rgyrh24 \$rgyrh25 \$rgyrh26 \$rgyrh27 \$rgyrh28 \$rgyrh29 \$rgyrh30"
}

quit
EOF


vmd -dispdev text -e RMSD.tcl 2> ${a[j]}/rmsd.txt    #runs RMSD scrpit from above generated
vmd -dispdev text -e RMSF_B.tcl 2> ${a[j]}/rmsf_b.txt  # runs RMSF for chain B scrpit from above
vmd -dispdev text -e RMSF_D.tcl 2> ${a[j]}/rmsf_d.txt # runs RMSF for chain D scrpit from above
vmd -dispdev text -e RMSF_F.tcl 2> ${a[j]}/rmsf_f.txt # runs RMSF for chain F scrpit from above
vmd -dispdev text -e xcom_helices.tcl 2> ${a[j]}/xcom_helices.txt  #runs helices center of mass scrpit from above generated
vmd -dispdev text -e inter_helices.tcl 2> ${a[j]}/inter_helices.txt  #runs inter helical angle scrpit from above generated
vmd -dispdev text -e rgyr.tcl 2> ${a[j]}/rgyr.txt #runs Radius of gyration scrpit from above generated

cd ${a[j]}/
mkdir hbonds #makes a new folder for hydrogen bond analysis
cp HBONDS.tcl hbonds/
cd hbonds 
vmd -dispdev text -e HBONDS.tcl 2> hbonds.log
cd ../

mkdir salt_bridges
cp salt.tcl salt_bridges/
cd salt
vmd -dispdev text -e salt.tcl 2> salt.log

cd ../../


done
done


#chmod a+x do_HA2.sh (this should be only done for once)

#./do_HA2.sh

# output of each analysis should be inside the respective folder of the system.

