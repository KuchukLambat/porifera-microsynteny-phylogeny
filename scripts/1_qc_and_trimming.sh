#!/bin/bash

# QC before trimming
mkdir ./results/fastqc_results_before

fastqc -o ./results/fastqc_results_before \
       ./data/transcriptomes/A_crassa_1.fastq \
       ./data/transcriptomes/A_crassa_2.fastq \
       ./data/transcriptomes/A_beatrix_1.fastq \
       ./data/transcriptomes/A_beatrix_2.fastq \
       ./data/transcriptomes/B_cyanae_1.fastq \
       ./data/transcriptomes/B_cyanae_2.fastq

multiqc ./results/fastqc_results_before -o ./results/multiqc_report_before

# Trimming
fastp -i ./data/transcriptomes/A_crassa_1.fastq \
      -I ./data/transcriptomes/A_crassa_2.fastq \
      -o ./data/transcriptomes/A_crassa_trim_1.fastq \
      -O ./data/transcriptomes/A_crassa_trim_2.fastq \
      --detect_adapter_for_pe --trim_poly_g

fastp -i ./data/transcriptomes/A_beatrix_1.fastq \
      -I ./data/transcriptomes/A_beatrix_2.fastq \
      -o ./data/transcriptomes/A_beatrix_trim_1.fastq \
      -O ./data/transcriptomes/A_beatrix_trim_2.fastq \
      --detect_adapter_for_pe --trim_poly_g

fastp -i ./data/transcriptomes/B_cyanae_1.fastq \
      -I ./data/transcriptomes/B_cyanae_2.fastq \
      -o ./data/transcriptomes/B_cyanae_trim_1.fastq \
      -O ./data/transcriptomes/B_cyanae_trim_2.fastq \
      --detect_adapter_for_pe --trim_poly_g

# QC after trimming
mkdir ./results/fastqc_results_after

fastqc -o ./results/fastqc_results_after \
       ./data/transcriptomes/A_crassa_trim_1.fastq \
       ./data/transcriptomes/A_crassa_trim_2.fastq \
       ./data/transcriptomes/A_beatrix_trim_1.fastq \
       ./data/transcriptomes/A_beatrix_trim_2.fastq \
       ./data/transcriptomes/B_cyanae_trim_1.fastq \
       ./data/transcriptomes/B_cyanae_trim_2.fastq

multiqc ./results/fastqc_results_after -o ./results/multiqc_report_after

