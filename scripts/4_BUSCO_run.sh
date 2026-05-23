#!/bin/bash

input_dir="./data/proteins"
out_dir="./analysis/busco_results"
metazoa_lineage="./data/dtb/busco_downloads/lineages/metazoa_odb12"
eukaryota_lineage="./data/dtb/busco_downloads/lineages/eukaryota_odb12"
summary_file="${out_dir}/busco_summary.txt"

mkdir "$out_dir"
touch "$summary_file"

for input_faa in "${input_dir}"/*.faa; do

    species_name=$(basename "$input_faa" .faa)

    if [ "$species_name" == "C_owczarzaki" ]; then
        current_lineage="$eukaryota_lineage"
    else
        current_lineage="$metazoa_lineage"
    fi

    busco -i "$input_faa" \
          -o "${species_name}" \
          --out_path "$out_dir" \
          -m protein \
          -l "$current_lineage" \
          --offline \
          -f

    summary_path=$(ls "${out_dir}/${species_name}"/short_summary.*.txt)
    busco_values=$(grep "C:" "$summary_path" | sed -e 's/^[ \t]*//' | head -n 1)
    echo -e "${species_name}\t${busco_values}" >> "$summary_file"

done

cp "$summary_file" ./results/busco_summary.txt

