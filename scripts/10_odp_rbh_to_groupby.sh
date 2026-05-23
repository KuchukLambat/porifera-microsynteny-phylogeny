#!/bin/bash
# odp rbh to groupby

project_root=$(pwd)
mkdir -p analysis/odp_run/8_odp_rbh_to_groupby
cp configs/configs/8_odp_rbh_to_groupby.yaml analysis/odp_run/8_odp_rbh_to_groupby/config.yaml
cd analysis/odp_run/8_odp_rbh_to_groupby

file_list=$(basename $(ls analysis/odp_run/7_odp_rbh_to_hmm/odp_rbh_to_HMM/output/Cowczarzaki_*.rbh))

for file in file_list
do
    sed -i "s|^rbh_file:.*|rbh_file: analysis/odp_run/7_odp_rbh_to_hmm/odp_rbh_to_HMM/output/$file|" config.yaml
    snakemake -s "$project_root/odp/scripts/odp_rbh_to_groupby" --cores 4
done

mv Cowczarzaki_Bmicroptera_Davara_Nvectensis_rbhhmm_plus_other_species.rbh.groupby Cowczarzaki_Bmicroptera_Davara_Nvectensis_rbhhmm_plus_other_species_reciprocal_best_hits.rbh.groupby
mv Cowczarzaki_Bmicroptera_Abeatrix_Nvectensis_rbhhmm_plus_other_species.rbh.groupby Cowczarzaki_Bmicroptera_Abeatrix_Nvectensis_rbhhmm_plus_other_species_reciprocal_best_hits.rbh.groupby
mv Cowczarzaki_Bmicroptera_Sciliatum_Nvectensis_rbhhmm_plus_other_species.rbh.groupby Cowczarzaki_Bmicroptera_Sciliatum_Nvectensis_rbhhmm_plus_other_species_reciprocal_best_hits.rbh.groupby
mv Cowczarzaki_Bmicroptera_Ccandelabrum_Nvectensis_rbhhmm_plus_other_species.rbh.groupby Cowczarzaki_Bmicroptera_Ccandelabrum_Nvectensis_rbhhmm_plus_other_species_reciprocal_best_hits.rbh.groupby

cd $project_root
