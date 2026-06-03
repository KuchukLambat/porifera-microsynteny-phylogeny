#!/bin/bash
# odp rbh merge

project_root=$(pwd)
mkdir -p analysis/odp_run/8_odp_rbh_merge
cp configs/8_odp_rbh_merge_config.yaml analysis/odp_run/8_odp_rbh_merge/config.yaml
cd analysis/odp_run/8_odp_rbh_merge

snakemake -s "$project_root/odp/scripts/odp_rbh_merge" --cores 4

cd $project_root
