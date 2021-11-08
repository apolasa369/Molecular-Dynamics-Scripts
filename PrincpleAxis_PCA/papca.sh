#!/bin/bash

export PYTHONPATH=$PYTHONPATH:/home/mahmoud/local/lib/python2.7/site-packages

python papc.py

if (( 1 ))
then
    echo "1        2        3        4        5        6        7        8        9        10       11       12" > PC
    cat papc-vecs.txt | awk -v i=1 '{x+=$i*$i;if(NR%3==0){printf "%f ",x;x=0}}END{print ""}' >> PC
    cat papc-vecs.txt | awk -v i=2 '{x+=$i*$i;if(NR%3==0){printf "%f ",x;x=0}}END{print ""}' >> PC
    cat papc-vecs.txt | awk -v i=3 '{x+=$i*$i;if(NR%3==0){printf "%f ",x;x=0}}END{print ""}' >> PC
fi
