import pandas as pd

color = ['#5e22e5', '#42bf44', '#8c072b', '#2291e5', '#adbf42', '#78078c', '#22e58f', '#bf6342', '#070a8c', '#60e522', 
         '#bf428e', '#077f8c', '#e5bf22', '#8242bf', '#078c24', '#e5222f', '#426fbf', '#5d8c07', '#e522da', '#42bfa1', 
         '#8c4507', '#4522e5', '#50bf42', '#8c073c', '#22a9e5', '#bdbf42', '#67078c', '#22e576', '#bf5442', '#071b8c', 
         '#79e522', '#bf429e', '#078c88', '#e5a622', '#7342bf', '#078c13', '#e52248', '#427fbf', '#6e8c07', '#d722e5', 
         '#42bf92', '#8c3407', '#2c22e5', '#60bf42', '#8c074d', '#22c2e5', '#bfb142', '#56078c', '#22e55d', '#bf4442', 
         '#072c8c', '#92e522', '#bf42ae', '#078c77', '#e58d22', '#6342bf', '#0b8c07', '#e52261', '#428fbf', '#7f8c07', 
         '#be22e5', '#42bf82', '#8c2307', '#2231e5', '#70bf42', '#8c075e', '#22dbe5', '#bfa142', '#45078c', '#22e544', 
         '#bf4251', '#073d8c', '#abe522', '#bf42be', '#078c66', '#e57522', '#5342bf', '#1c8c07', '#e5227a', '#429fbf', 
         '#8c8707', '#a522e5', '#42bf72', '#8c1207', '#2249e5', '#80bf42', '#8c076f', '#22e5d6', '#bf9142', '#34078c', 
         '#22e52b', '#bf4261', '#074e8c', '#c4e522', '#b042bf', '#078c55', '#e55c22', '#4342bf', '#2d8c07', '#e52293',
         ]


path_1 = '/11_odp_groupby_filter/odp_groupby_filter/output/combined.rbh.filt.groupby'
df_groupby = pd.read_csv(path_1, sep='\t')

df_groupby_edit = df_groupby.copy()

df_groupby_edit[['gene_group', 'color']] = [[f'ALG_{i}', color[i-1]] for i in range(1, len(df_groupby)+1)]

path_to_save = '/11_odp_groupby_filter/odp_groupby_filter/output/combined_annotated.filt.groupby'
df_groupby_edit.to_csv(path_to_save, sep='\t', index=False)
