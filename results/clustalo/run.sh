#!/bin/bash

HOMFAM="../../data/homfam/train/*.fasta"
BALIFAM100="../../data/balifam100/train/*.fasta"
BALIFAM1000="../../data/balifam1000/train/*.fasta"
BALIFAM10000="../../data/balifam10000/train/*.fasta"

run () {
    for f in $1
    do
	filename=$(basename "$f")
	{ time clustalo-1.2.4 -t protein -i $f --outfmt=fa -o alignments/$filename ; } 2> times/${filename%.fasta}.time.txt
    done
}

run "${HOMFAM}"
run "${BALIFAM100}"
run "${BALIFAM1000}"
run "${BALIFAM10000}"















