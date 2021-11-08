



#!/bin/bash

cat > indices.tcl << EOF #writes a file for RMSD analysis 


mol new step5_assembly.namd.psf
mol addfile step5_assembly.namd.pdb
set pro [atomselect top "protein and alpha"] #selection of whole protein and just c alpha atoms
puts stderr "[$pro get index]"

$pro writepdb HA2.ca.pdb #write new pdb and psf files with only c alpha atoms of protein for striping the trajectory
$pro writepsf HA2.ca.psf

quit
EOF

cat > indices_B.tcl << EOF #writes a file for RMSD analysis 


mol new step5_assembly.namd.psf
mol addfile step5_assembly.namd.pdb
set pro [atomselect top "protein and and segname PROB and alpha"] #selection of whole protein and just c alpha atoms
puts stderr "[$pro get index]"

$pro writepdb HA2.ca.B.pdb #write new pdb and psf files with only c alpha atoms of protein for striping the trajectory
$pro writepsf HA2.ca.B.psf

quit
EOF


cat > indices_D.tcl << EOF #writes a file for RMSD analysis 


mol new step5_assembly.namd.psf
mol addfile step5_assembly.namd.pdb
set pro [atomselect top "protein and and segname PROD and alpha"] #selection of whole protein and just c alpha atoms
puts stderr "[$pro get index]"

$pro writepdb HA2.ca.D.pdb #write new pdb and psf files with only c alpha atoms of protein for striping the trajectory
$pro writepsf HA2.ca.D.psf

quit
EOF

cat > indices_F.tcl << EOF #writes a file for RMSD analysis 


mol new step5_assembly.namd.psf
mol addfile step5_assembly.namd.pdb
set pro [atomselect top "protein and and segname PROF and alpha"] #selection of whole protein and just c alpha atoms
puts stderr "[$pro get index]"

$pro writepdb HA2.ca.F.pdb #write new pdb and psf files with only c alpha atoms of protein for striping the trajectory
$pro writepsf HA2.ca.F.psf

quit
EOF



vmd -dispdev text -e indices.tcl 2> indices.txt #sometimes inside indices.txt file first line have some letters printed just clear that line and run the following scrpit
vmd -dispdev text -e indices_B.tcl 2> indices_B.txt #sometimes inside indices.txt file first line have some letters printed just clear that line and run the following scrpit
vmd -dispdev text -e indices_D.tcl 2> indices_D.txt #sometimes inside indices.txt file first line have some letters printed just clear that line and run the following scrpit
vmd -dispdev text -e indices_F.tcl 2> indices_F.txt #sometimes inside indices.txt file first line have some letters printed just clear that line and run the following scrpit
