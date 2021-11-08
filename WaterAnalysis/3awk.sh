#!/bin/bash
# This script adds up the values in each column of a data file.
#Output : column index | sum of each column, standard deviation (per column)
# 1st frame is neglected
#include right number of frames from your trajectory
tot=0
j=1
sum=0
#nbins=81
#noframes-1=202
sumisq=0
sdev=0
isqsum=0
#NR=1769

awk '{  for (i=1; i<=NF; i++) {if (NR!=1) {sum[i]+= $i; isqsum[i]+= $i^2}} }
END{ for (i=1; i<=NF; i++ ) {
               if (NR!=1) {
               sdev[i]=sqrt( ( ( NR*isqsum[i] )-( sum[i]^2 ) )/NR^2 )
#
               print (j-40), sum[i]/19668, sdev[i]; j=j+1 }} 
          }' water_Bchain.txt > watercountZ_Bchain.dat   ## This is from -40 ---> +40, as a function of Z change the file name according to your file name  #19668 in the above line are number of frames


