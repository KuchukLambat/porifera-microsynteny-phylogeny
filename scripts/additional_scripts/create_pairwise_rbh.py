import pandas as pd

path = '/odp_groupby_to_rbh/output/Abeatrix_Acrassa_Bcyanae_Bmicroptera_Ccandelabrum_Celegans_Cowczarzaki_Davara_Dpulex_Harmigera_Hpanicea_Hsymbiolongicarpus_Mleidyi_Nvectensis_Olobularis_Pverrucosa_Sciliatum_Srosetta.unwrapped.rbh'
df_rbh = pd.read_csv(path, sep='\t')

df_rbh['whole_FET'] = [0.0] * (len(df_rbh))
df_rbh['break_FET'] = df_rbh['whole_FET']

species = [column.split('_')[0] for column in df_rbh.columns if column.endswith('_gene')]
num_species = len(species)

for sp_1 in range(num_species):
    for sp_2 in range(num_species):
        if sp_1 == sp_2:
            continue 
        sp_1_col, sp_2_col = species[sp_1], species[sp_2]
        
        selected_columns = ['rbh', 
                    f'{sp_1_col}_gene', 
                    f'{sp_2_col}_gene',
                    'gene_group',
                    f'{sp_1_col}_scaf',
                    f'{sp_1_col}_pos',
                    f'{sp_2_col}_scaf',
                    f'{sp_2_col}_pos',
                    'whole_FET',
                    'break_FET',
                    'color',
                    ]
        
        df_rbh_plotted = df_rbh[selected_columns].dropna()
        file_name = f'/odp_groupby_to_rbh/output/rbh_for_ribbon_plot/{sp_1_col}_{sp_2_col}.plotted.rbh'
        df_rbh_plotted.to_csv(file_name, sep='\t', index=False)
