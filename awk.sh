awk '{ sum += $1; sumsq += ($1)^2 } END { if (NR > 0) print sum / NR }' YLALW_water.log >> YLALW_PW.txt
awk '{ sum += $1; sumsq += ($1)^2 } END { if (NR > 0) print sum / NR }' YLFLW_water.log >> YLFLW_PW.txt
awk '{ sum += $1; sumsq += ($1)^2 } END { if (NR > 0) print sum / NR }' YLKLW_water.log >> YLKLW_PW.txt
awk '{ sum += $1; sumsq += ($1)^2 } END { if (NR > 0) print sum / NR }' YLLLW_water.log >> YLLLW_PW.txt
awk '{ sum += $1; sumsq += ($1)^2 } END { if (NR > 0) print sum / NR }' YSASW_water.log >> YSASW_PW.txt
awk '{ sum += $1; sumsq += ($1)^2 } END { if (NR > 0) print sum / NR }' YSFSW_water.log >> YSFSW_PW.txt
awk '{ sum += $1; sumsq += ($1)^2 } END { if (NR > 0) print sum / NR }' YSKSW_water.log >> YSKSW_PW.txt
awk '{ sum += $1; sumsq += ($1)^2 } END { if (NR > 0) print sum / NR }' YSLSW_water.log >> YSLSW_PW.txt
#######################
awk '{ sum += $1; sumsq += ($1)^2 } END { if (NR > 0) print sum / NR }' YLALW_octanol.log >> YLALW_PO.txt
awk '{ sum += $1; sumsq += ($1)^2 } END { if (NR > 0) print sum / NR }' YLFLW_octanol.log >> YLFLW_PO.txt
awk '{ sum += $1; sumsq += ($1)^2 } END { if (NR > 0) print sum / NR }' YLKLW_octanol.log >> YLKLW_PO.txt
awk '{ sum += $1; sumsq += ($1)^2 } END { if (NR > 0) print sum / NR }' YLLLW_octanol.log >> YLLLW_PO.txt
awk '{ sum += $1; sumsq += ($1)^2 } END { if (NR > 0) print sum / NR }' YSASW_octanol.log >> YSASW_PO.txt
awk '{ sum += $1; sumsq += ($1)^2 } END { if (NR > 0) print sum / NR }' YSFSW_octanol.log >> YSFSW_PO.txt
awk '{ sum += $1; sumsq += ($1)^2 } END { if (NR > 0) print sum / NR }' YSKSW_octanol.log >> YSKSW_PO.txt
awk '{ sum += $1; sumsq += ($1)^2 } END { if (NR > 0) print sum / NR }' YSLSW_octanol.log >> YSLSW_PO.txt

paste YLALW_PO.txt YLALW_PW.txt > YLALW.dat
paste YLKLW_PO.txt YLKLW_PW.txt > YLKLW.dat
paste YLLLW_PO.txt YLLLW_PW.txt > YLLLW.dat
paste YLFLW_PO.txt YLFLW_PW.txt > YLFLW.dat

paste YSASW_PO.txt YSASW_PW.txt > YSASW.dat
paste YSKSW_PO.txt YSKSW_PW.txt > YSKSW.dat
paste YSLSW_PO.txt YSLSW_PW.txt > YSLSW.dat
paste YSFSW_PO.txt YSFSW_PW.txt > YSFSW.dat


rm *.txt
