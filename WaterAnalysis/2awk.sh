#!/bin/bash
# This script adds up the values in each row of a data file.
#Output : row no. | sum of each row

tot=0
j=1
#time=314
#noframes=1577

awk '{ for(i=25; i<=55; ++i)
          {tot = tot + $i}
          j=j+1;
          time=19668;
          noframes=19668;
          print j*time/noframes, tot/19668;
          tot=0; 
     }' water_Bchain.txt > watercount_Bchain.dat #change the file name according to your file name  #19668 in the above line are number of framess
