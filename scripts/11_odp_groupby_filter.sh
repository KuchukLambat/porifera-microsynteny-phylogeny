#!/bin/bash
# odp groupby filter

project_root=$(pwd)
mkdir -p analysis/odp_run/9_odp_groupby_filter
cp configs/configs/9_odp_groupby_filter_config.yaml analysis/odp_run/9_odp_groupby_filter/config.yaml
cd analysis/odp_run/9_odp_groupby_filter

snakemake -s "$project_root/odp/scripts/odp_groupby_filter" --cores 4

python "$project_root/scripts/additional_scripts/to_combine.py"

python "$project_root/scripts/additional_scripts/annotate_ALGs.py"

cd combined_annotated.filt.groupby ../../../results/combined_annotated.filt.groupby

cd $project_root
