
#! /bin/bash

#$ -cwd
#
#$ -m e
#$ -S /bin/bash
#$ -e error_screen
#$ -o output_screen
#$ -l h_rt=840:00:00
#$ -q all.q
#$ -pe orte 1

receptor_file='receptor.pdbqt'
config_file='config.txt'

#mkdir results
#mkdir logs

for f in `seq 1 10`; do
    b=`Target $f`
    vina --config $config_file --receptor $receptor_file --cpu 1 --ligand Target$f.pdbqt --out results/$f._vina.pdbqt --log logs/$f._vina.log
    result=$(cat results/$f._vina.pdbqt | head -2 | tail -1 | awk '{print $4}')
    echo $f $result >> results1.dat

done
echo "SCREENING DONE"
