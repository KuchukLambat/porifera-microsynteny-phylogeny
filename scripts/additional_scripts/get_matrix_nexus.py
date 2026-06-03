import pandas as pd

ALGs = [f'ALG_{i}+ALG_{j}' for i in range(1, 17) for j in range(i+1, 17)]
tax = ['Srosetta', 'Cowczarzaki', 'Bmicroptera', 'Mleidyi', 'Davara', 'Acrassa', 
 'Hpanicea', 'Abeatrix', 'Bcyanae', 'Sciliatum', 'Ccandelabrum', 'Olobularis', 
 'Pverrucosa', 'Hsymbiolongicarpus', 'Nvectensis', 'Celegans', 'Dpulex', 'Harmigera',
 ]


df_nex = pd.DataFrame([[0] * len(ALGs) for _ in range(len(tax))], 
                      index=tax, columns=ALGs)

df_mixing = pd.read_csv('analysis/odp_run/12_odp_rbh_plot_mixing/odp_rbh_plot_mixing/output_mixing_merged/all_species_mixing.tsv', 
                        sep='\t', , usecols=['species', 'mixed_groups', 'genestring'])

for i in range(len(df_mixing)):
    sp = df_mixing.iloc[i]['species']
    mixed_groups = df_mixing.iloc[i]['mixed_groups']
    df_nex.loc[sp, mixed_groups] = ('AB' in df_mixing.loc[i]['genestring'] and
                                   'BA' in df_mixing.loc[i]['genestring']) + 1

df_nex_str = df_nex.astype('str')

matrix_lines = []
for i in range(len(df_nex)):
    name = f'{df_nex_str.index[i]}{" " * (20 - len(df_nex_str.index[i]))}'
    matrix_lines.append(f'\t{name} {"".join(list(df_nex_str.iloc[i]))}')

matrix_content = "\n".join(matrix_lines)
header_algs = " ".join(ALGs)

text = f"""#NEXUS
# {header_algs}
BEGIN DATA;
\tDIMENSIONS  NCHAR={len(ALGs)} NTAX={len(tax)};
\tFORMAT DATATYPE=STANDARD GAP=- MISSING=? SYMBOLS="012";

\tMATRIX
{matrix_content}

;

END;
"""

with open('FWM_matrix_ALGs_porifera.nex', 'w') as file:
    file.write(text)
