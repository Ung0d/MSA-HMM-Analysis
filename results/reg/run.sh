#!/bin/bash

HOMFAM="../../data/homfam/train/*.fasta"
BALIFAM100="../../data/balifam100/train/*.fasta"
BALIFAM1000="../../data/balifam1000/train/*.fasta"
BALIFAM10000="../../data/balifam10000/train/*.fasta"
BALIFRAG="../../data/balifrag/train/*.fasta"

run () {
    for f in $1
    do
	filename=$(basename "$f")
	#slow and accurate settings
	{ time t_coffee -seq $f -reg -nseq 100 -tree mbed -method mafftginsi_msa -outfile "alignments/$filename" -outtree "trees/${filename%.fasta}.mbed" ; } 2> times/${filename%.fasta}.time.txt   
    done
}

run "${HOMFAM}"
run "${BALIFAM100}"
run "${BALIFAM1000}"
run "${BALIFAM10000}"
run "${BALIFRAG}"
















