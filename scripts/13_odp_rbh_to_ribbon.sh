#!/bin/bash
# odp rbh to ribbon

project_root=$(pwd)
mkdir -p analysis/odp_run/11_odp_rbh_to_ribbon
cp configs/configs/11_odp_rbh_to_ribbon_config.yaml analysis/odp_run/11_odp_rbh_to_ribbon/config.yaml
cd analysis/odp_run/11_odp_rbh_to_ribbon

snakemake -s "$project_root/odp/scripts/odp_rbh_to_ribbon" --cores 4

cp output.pdf ../../../results/ribbon_plot.pdf

cd $project_root
