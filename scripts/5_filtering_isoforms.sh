#!/bin/bash

annot_dir="./data/annotations"
genom_dir="./data/genomes"
prot_dir="./data/proteins"

#Converting .gtf to .gff
for gtf in "$annot_dir"/*.gtf; do
    filename=$(basename "$gtf")
    name="${filename%.gtf}"
    gff="$annot_dir/${name}.gff"
    
    agat_convert_sp_gxf2gxf.pl -g "$gtf" -o "$gff"
    
    rm "$gtf"
done

# Filtering the longest isoforms
for gff in "$annot_dir"/*.gff; do
    filename=$(basename "$gff")
    name="${filename%.gff}"
    output_gff="$annot_dir/${name}_longest.gff.tmp"
    
    agat_sp_keep_longest_isoform.pl --gff "$gff" --output "$output_gff"
done

# Extracting proteome from genome
for gff in "$annot_dir"/*_longest.gff.tmp; do
    filename=$(basename "$gff")
    name="${filename%_longest.gff.tmp}"
    fasta="$genom_dir/${name}.fna"
    output_faa="$prot_dir/${name}.faa.tmp"
    
    agat_sp_extract_sequences.pl \
      --gff "$gff" \
      --fasta "$fasta" \
      --protein \
      --output "$output_faa"
done

# Final cleaning and adding prefixes
JUNK="agat-|cds-|rna-"

for gff_tmp in "$annot_dir"/*_longest.gff.tmp; do
    filename=$(basename "$gff_tmp")
    name="${filename%_longest.gff.tmp}"
    faa_tmp="$prot_dir/${name}.faa.tmp"
    
    final_gff="$annot_dir/${name}_longest.gff"
    final_faa="$prot_dir/${name}.faa"
    
    PREFIX="${name:0:1}${name:2:3}"
    
    sed -E "s/(ID|Parent)=/\0${PREFIX}_/g; s/${PREFIX}_(${JUNK})/${PREFIX}_/g" "$gff_tmp" > "$final_gff"
    rm "$gff_tmp"
    
    sed -E "s/>/>${PREFIX}_/g; s/${PREFIX}_(${JUNK})/${PREFIX}_/g" "$faa_tmp" > "$final_faa"
    rm "$faa_tmp"
done

