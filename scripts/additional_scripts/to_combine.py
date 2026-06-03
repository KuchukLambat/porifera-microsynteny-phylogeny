import pandas as pd

files = [
    '/9_odp_groupby_filter/odp_groupby_filter/output/Cowczarzaki_Bmicroptera_Abeatrix_Nvectensis_rbhhmm_plus_other_species_reciprocal_best_hits.rbh.filt.groupby',
    '/9_odp_groupby_filter/odp_groupby_filter/output/Cowczarzaki_Bmicroptera_Ccandelabrum_Nvectensis_rbhhmm_plus_other_species_reciprocal_best_hits.rbh.filt.groupby',
    '/9_odp_groupby_filter/odp_groupby_filter/output/Cowczarzaki_Bmicroptera_Davara_Nvectensis_rbhhmm_plus_other_species_reciprocal_best_hits.rbh.filt.groupby',
    '/9_odp_groupby_filter/odp_groupby_filter/output/Cowczarzaki_Bmicroptera_Sciliatum_Nvectensis_rbhhmm_plus_other_species_reciprocal_best_hits.rbh.filt.groupby',
]

dfs = [pd.read_csv(file, sep='\t') for file in files]

output = pd.concat(dfs, ignore_index=True)

output.to_csv('/9_odp_groupby_filter/odp_groupby_filter/output/combined.rbh.filt.groupby',  sep='\t', index=False)
