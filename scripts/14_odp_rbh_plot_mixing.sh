#!/bin/bash
# odp_rbh_plot_mixing

project_root=$(pwd)
mkdir -p analysis/odp_run/12_odp_rbh_plot_mixing
cp configs/configs/12_odp_rbh_plot_mixing_config.yaml analysis/odp_run/12_odp_rbh_plot_mixing/config.yaml
cd analysis/odp_run/12_odp_rbh_plot_mixing

snakemake -s "$project_root/odp/scripts/odp_rbh_plot_mixing" --cores 4

cp /odp_rbh_plot_mixing/output_mixing_merged/all_species_mixing.tsv ../../../results/all_species_mixing.tsv

cd $project_root
