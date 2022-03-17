#!/bin/bash

echo "path"
`pwd`

organ=$1
nbase=$2
seq=$(printf "%0.s." $(seq 1 $nbase))
echo "chopped base number of forward barcode region $nbase"
#echo $seq

echo "original barcode number"
less ./${organ}_filtered_feature_bc_matrix/barcodes.tsv.gz |wc -l

echo "unique barcode number"
less ./${organ}_filtered_feature_bc_matrix/barcodes.tsv.gz |awk -F'-' '{print $1}'|sed "s/^$seq//g"|sort |uniq -c|awk 'BEGIN{OFS="\t"}$1=="1"{print $2}'|wc -l

