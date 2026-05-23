#!/bin/bash

PROT_DB="./data/dtb/Metazoa_odb12.faa"

# Path to SIF-container of BRAKER3
SIF="/path/to/container/braker3_new.sif"

GENOMES=(
    "./analysis/annotating/A_crassa/A_crassa.fna.masked"
    "./analysis/annotating/A_beatrix/A_beatrix.fna.masked"
    "./analysis/annotating/B_cyanae/B_cyanae.fna.masked")

for genome_masked in "${GENOMES[@]}"; do
    species_dir=$(dirname "$genome_masked")
    species_name=$(basename "$species_dir")
    genome_file=$(basename "$genome_masked")

    OUT_DIR="${species_dir}/braker_output"
    CONFIG_DIR="${species_dir}/augustus_config"
    mkdir "$OUT_DIR"

    if [ ! -d "$CONFIG_DIR" ]; then
        apptainer exec "$SIF" cp -r /opt/Augustus/config "$CONFIG_DIR"
    fi

    apptainer exec --fakeroot \
      -B "${species_dir}:/dir" \
      -B "${PROT_DB}:/prots/db.faa" \
      -B "${CONFIG_DIR}:/config" \
      "$SIF" \
      braker.pl --genome="/dir/${genome_file}" \
                --bam="/dir/mapping/Aligned.sortedByCoord.out.bam" \
                --prot_seq="/prots/db.faa" \
                --species="${species_name}" \
                --AUGUSTUS_CONFIG_PATH="/config" \
                --workingdir="/dir/braker_output" \
                --softmasking \
                --useexisting
done

cp ./analysis/annotating/A_crassa/braker_output/braker.gtf ./data/annotations/A_crassa.gtf
cp ./analysis/annotating/A_beatrix/braker_output/braker.gtf ./data/annotations/A_beatrix.gtf
cp ./analysis/annotating/B_cyanae/braker_output/braker.gtf ./data/annotations/B_cyanae.gtf

cp ./analysis/annotating/A_crassa/braker_output/braker.aa ./data/proteins/A_crassa_raw.faa
cp ./analysis/annotating/A_beatrix/braker_output/braker.aa ./data/proteins/A_beatrix_raw.faa
cp ./analysis/annotating/B_cyanae/braker_output/braker.aa ./data/proteins/B_cyanae_raw.faa

