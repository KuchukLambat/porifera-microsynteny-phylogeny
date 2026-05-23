#!/bin/bash
# odp nway rbh

project_root=$(pwd)
mkdir -p analysis/odp_run/5_odp_nway_rbh
cp configs/5_odp_nway_rbh_config.yaml analysis/odp_run/5_odp_nway_rbh/config.yaml
cd analysis/odp_run/5_odp_nway_rbh/

snakemake -s "$project_root/odp/scripts/odp_nway_rbh" --cores 4

cd $project_root
