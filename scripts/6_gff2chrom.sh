#!/bin/bash
# Translate GFF into CHROM

file_list=data/annotations/*_longest.gff

for i in $file_list
do 
    base_name=$(basename "$i")
    new_name="${base_name/_longest.gff/.chrom}"
    python /odp/scripts/NCBIgff2chrom_cus.py $i > "data/chromes/$new_name"
done
