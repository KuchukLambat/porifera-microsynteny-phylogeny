#!/bin/bash

# Downloading genomes
curl https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/963/678/975/GCF_963678975.1_odDysAvar1.4/GCF_963678975.1_odDysAvar1.4_genomic.fna.gz | gunzip > ./data/genomes/D_avara.fna
curl https://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/964/263/335/GCA_964263335.1_odAioCras1.1/GCA_964263335.1_odAioCras1.1_genomic.fna.gz | gunzip > ./data/genomes/A_crassa.fna
curl https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/963/675/165/GCF_963675165.1_odHalPani1.1/GCF_963675165.1_odHalPani1.1_genomic.fna.gz | gunzip > ./data/genomes/H_panicea.fna
curl https://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/963/281/255/GCA_963281255.1_ohAphBeat7.1/GCA_963281255.1_ohAphBeat7.1_genomic.fna.gz | gunzip > ./data/genomes/A_beatrix.fna
curl https://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/964/258/925/GCA_964258925.1_ohBolCyan1.1/GCA_964258925.1_ohBolCyan1.1_genomic.fna.gz | gunzip > ./data/genomes/B_cyanae.fna
curl https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/964/019/385/GCF_964019385.1_ocSycCili1.1/GCF_964019385.1_ocSycCili1.1_genomic.fna.gz | gunzip > ./data/genomes/S_ciliatum.fna
curl https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/963/422/355/GCF_963422355.1_ooCorCand1.1/GCF_963422355.1_ooCorCand1.1_genomic.fna.gz | gunzip > ./data/genomes/C_candelabrum.fna
curl https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/947/507/565/GCF_947507565.1_ooOscLobu1.1/GCF_947507565.1_ooOscLobu1.1_genomic.fna.gz | gunzip > ./data/genomes/O_lobularis.fna
curl https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/036/669/915/GCF_036669915.1_ASM3666991v2/GCF_036669915.1_ASM3666991v2_genomic.fna.gz | gunzip > ./data/genomes/P_verrucosa.fna
curl https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/029/227/915/GCF_029227915.1_HSymV2.1/GCF_029227915.1_HSymV2.1_genomic.fna.gz | gunzip > ./data/genomes/H_symbiolongicarpus.fna
curl https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/932/526/225/GCF_932526225.1_jaNemVect1.1/GCF_932526225.1_jaNemVect1.1_genomic.fna.gz | gunzip > ./data/genomes/N_vectensis.fna
curl https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/026/151/205/GCF_026151205.1_MBARI_Bmic_1.0/GCF_026151205.1_MBARI_Bmic_1.0_genomic.fna.gz | gunzip > ./data/genomes/B_microptera.fna
curl https://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/048/537/945/GCA_048537945.1_crg_Mlei_v2/GCA_048537945.1_crg_Mlei_v2_genomic.fna.gz | gunzip > ./data/genomes/M_leidyi.fna
curl https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/151/315/GCF_000151315.2_C_owczarzaki_V2/GCF_000151315.2_C_owczarzaki_V2_genomic.fna.gz | gunzip > ./data/genomes/C_owczarzaki.fna

# Downloading of proteins
curl https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/963/678/975/GCF_963678975.1_odDysAvar1.4/GCF_963678975.1_odDysAvar1.4_protein.faa.gz | gunzip > ./data/proteins/D_avara_raw.faa
curl https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/963/675/165/GCF_963675165.1_odHalPani1.1/GCF_963675165.1_odHalPani1.1_protein.faa.gz | gunzip > ./data/proteins/H_panicea_raw.faa
curl https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/964/019/385/GCF_964019385.1_ocSycCili1.1/GCF_964019385.1_ocSycCili1.1_protein.faa.gz | gunzip > ./data/proteins/S_ciliatum_raw.faa
curl https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/963/422/355/GCF_963422355.1_ooCorCand1.1/GCF_963422355.1_ooCorCand1.1_protein.faa.gz | gunzip > ./data/proteins/C_candelabrum_raw.faa
curl https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/947/507/565/GCF_947507565.1_ooOscLobu1.1/GCF_947507565.1_ooOscLobu1.1_protein.faa.gz | gunzip > ./data/proteins/O_lobularis_raw.faa
curl https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/036/669/915/GCF_036669915.1_ASM3666991v2/GCF_036669915.1_ASM3666991v2_protein.faa.gz | gunzip > ./data/proteins/P_verrucosa_raw.faa
curl https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/029/227/915/GCF_029227915.1_HSymV2.1/GCF_029227915.1_HSymV2.1_protein.faa.gz | gunzip > ./data/proteins/H_symbiolongicarpus_raw.faa
curl https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/932/526/225/GCF_932526225.1_jaNemVect1.1/GCF_932526225.1_jaNemVect1.1_protein.faa.gz | gunzip > ./data/proteins/N_vectensis_raw.faa
curl https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/026/151/205/GCF_026151205.1_MBARI_Bmic_1.0/GCF_026151205.1_MBARI_Bmic_1.0_protein.faa.gz | gunzip > ./data/proteins/B_microptera_raw.faa
curl https://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/048/537/945/GCA_048537945.1_crg_Mlei_v2/GCA_048537945.1_crg_Mlei_v2_protein.faa.gz | gunzip > ./data/proteins/M_leidyi_raw.faa
curl https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/151/315/GCF_000151315.2_C_owczarzaki_V2/GCF_000151315.2_C_owczarzaki_V2_protein.faa.gz | gunzip > ./data/proteins/C_owczarzaki_raw.faa

# Downloading annotations
curl https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/963/678/975/GCF_963678975.1_odDysAvar1.4/GCF_963678975.1_odDysAvar1.4_genomic.gff.gz | gunzip > ./data/annotations/D_avara.gff
curl https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/963/675/165/GCF_963675165.1_odHalPani1.1/GCF_963675165.1_odHalPani1.1_genomic.gff.gz | gunzip > ./data/annotations/H_panicea.gff
curl https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/964/019/385/GCF_964019385.1_ocSycCili1.1/GCF_964019385.1_ocSycCili1.1_genomic.gff.gz | gunzip > ./data/annotations/S_ciliatum.gff
curl https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/963/422/355/GCF_963422355.1_ooCorCand1.1/GCF_963422355.1_ooCorCand1.1_genomic.gff.gz | gunzip > ./data/annotations/C_candelabrum.gff
curl https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/947/507/565/GCF_947507565.1_ooOscLobu1.1/GCF_947507565.1_ooOscLobu1.1_genomic.gff.gz | gunzip > ./data/annotations/O_lobularis.gff
curl https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/036/669/915/GCF_036669915.1_ASM3666991v2/GCF_036669915.1_ASM3666991v2_genomic.gff.gz | gunzip > ./data/annotations/P_verrucosa.gff
curl https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/029/227/915/GCF_029227915.1_HSymV2.1/GCF_029227915.1_HSymV2.1_genomic.gff.gz | gunzip > ./data/annotations/H_symbiolongicarpus.gff
curl https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/932/526/225/GCF_932526225.1_jaNemVect1.1/GCF_932526225.1_jaNemVect1.1_genomic.gff.gz | gunzip > ./data/annotations/N_vectensis.gff
curl https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/026/151/205/GCF_026151205.1_MBARI_Bmic_1.0/GCF_026151205.1_MBARI_Bmic_1.0_genomic.gff.gz | gunzip > ./data/annotations/B_microptera.gff
curl https://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/048/537/945/GCA_048537945.1_crg_Mlei_v2/GCA_048537945.1_crg_Mlei_v2_genomic.gff.gz | gunzip > ./data/annotations/M_leidyi.gff
curl https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/000/151/315/GCF_000151315.2_C_owczarzaki_V2/GCF_000151315.2_C_owczarzaki_V2_genomic.gff.gz | gunzip > ./data/annotations/C_owczarzaki.gff

# Downloading transcriptomes
curl ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR139/032/ERR13962532/ERR13962532_1.fastq.gz | gunzip > ./data/transcriptomes/A_crassa_1.fastq
curl ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR139/032/ERR13962532/ERR13962532_2.fastq.gz | gunzip > ./data/transcriptomes/A_crassa_2.fastq
curl ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR123/029/ERR12321229/ERR12321229_1.fastq.gz | gunzip > ./data/transcriptomes/A_beatrix_1.fastq
curl ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR123/029/ERR12321229/ERR12321229_2.fastq.gz | gunzip > ./data/transcriptomes/A_beatrix_2.fastq
curl ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR139/029/ERR13962529/ERR13962529_1.fastq.gz | gunzip > ./data/transcriptomes/B_cyanae_1.fastq
curl ftp://ftp.sra.ebi.ac.uk/vol1/fastq/ERR139/029/ERR13962529/ERR13962529_2.fastq.gz | gunzip > ./data/transcriptomes/B_cyanae_2.fastq
