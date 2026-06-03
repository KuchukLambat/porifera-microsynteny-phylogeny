#!/bin/bash
# odp groupby to rbh

project_root=$(pwd)
SPECIES_LIST="Abeatrix_Acrassa_Bcyanae_Bmicroptera_Ccandelabrum_Celegans_Cowczarzaki_Davara_Dpulex_Harmigera_Hpanicea_Hsymbiolongicarpus_Mleidyi_Nvectensis_Olobularis_Pverrucosa_Sciliatum_Srosetta"

mkdir -p analysis/odp_run/12_odp_groupby_to_rbh
cp configs/configs/12_odp_groupby_to_rbh_config.yaml analysis/odp_run/12_odp_groupby_to_rbh/config.yaml
cd analysis/odp_run/12_odp_groupby_to_rbh

snakemake -s "$project_root/odp/scripts/odp_groupby_to_rbh" --cores 4

cp "${SPECIES_LIST}.unwrapped.rbh" "../../../results/${SPECIES_LIST}.unwrapped.rbh"

python scripts/additional_scripts/create_pairwise_rbh.py

cd $project_root
