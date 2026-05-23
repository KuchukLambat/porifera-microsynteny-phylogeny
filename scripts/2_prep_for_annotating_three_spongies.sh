#!/bin/bash

GENOMES=(
    "./data/genomes/A_crassa.fna"
    "./data/genomes/A_beatrix.fna"
    "./data/genomes/B_cyanae.fna")

# Masking of genomes
for genome_fna in "${GENOMES[@]}"; do
    species_name=$(basename "$genome_fna" .fna)
    species_dir="./analysis/annotating/${species_name}"

    mkdir "$species_dir"

    RepeatMasker -lib ./data/dtb/porifera_7species_repdb-families.fa \
                 -xsmall \
                 -gff \
                 -dir "$species_dir" \
                 "$genome_fna"

    sed -i 's/ .*//' "${species_dir}/${species_name}.fna.masked"
done

# Indexing of masked genomes
for genome_fna in "${GENOMES[@]}"; do
    species_name=$(basename "$genome_fna" .fna)
    annot_dir="./analysis/annotating/${species_name}"
    index_dir="${annot_dir}/star_index"
    genome_masked="${annot_dir}/${species_name}.fna.masked"

    mkdir "$index_dir"

    STAR --runMode genomeGenerate \
         --genomeDir "$index_dir" \
         --genomeFastaFiles "$genome_masked" \
         --genomeSAindexNbases 12 \
         --limitGenomeGenerateRAM 35000000000
done

# Mapping of reads on masked genomes
for genome_fna in "${GENOMES[@]}"; do
    species_name=$(basename "$genome_fna" .fna)
    index_dir="./analysis/annotating/${species_name}/star_index"

    r1_read="./data/transcriptomes/${species_name}_trim_1.fastq"
    r2_read="./data/transcriptomes/${species_name}_trim_2.fastq"

    out_dir="./analysis/annotating/${species_name}/mapping"
    mkdir "$out_dir"

    STAR --genomeDir "$index_dir" \
         --readFilesIn "$r1_read" "$r2_read" \
         --outFileNamePrefix "${out_dir}/" \
         --outSAMtype BAM SortedByCoordinate \
         --outSAMstrandField intronMotif \
         --outSAMattributes NH HI AS nM XS \
         --alignIntronMax 50000 \
         --alignMatesGapMax 50000 \
         --limitBAMsortRAM 40000000000

    samtools index "${out_dir}/Aligned.sortedByCoord.out.bam"
done

