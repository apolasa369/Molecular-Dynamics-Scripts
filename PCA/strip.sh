#!/bin/bash

DIR=/Scratch/apolasa/Yidc/analysis/3wvf-loop #directoy path where you have the dcd files for the system
SAV=/Scratch/apolasa/Yidc/analysis/3wvf-loop/PCA #directoy path where you wanna save the results


    catdcd -o $SAV/HA2.ca.dcd -i $DIR/indices.txt $DIR/all.dcd  #for this analysis -o option is for saving the new dcd coodinates to a new file and the dcd listed at the end of the line is whole combined trajectory of the system 
    catdcd -o $SAV/HA2.ca.B.dcd -i $DIR/indices_B.txt $DIR/all.dcd
    catdcd -o $SAV/HA2.ca.D.dcd -i $DIR/indices_D.txt $DIR/all.dcd
    catdcd -o $SAV/HA2.ca.F.dcd -i $DIR/indices_F.txt $DIR/all.dcd


#catdcd -o all.ca.dcd $s
