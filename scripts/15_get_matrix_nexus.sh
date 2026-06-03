#!/bin/bash
# get matrix nexus

project_root=$(pwd)
mkdir -p analysis/odp_run/15_get_matrix_nexus
cd analysis/odp_run/15_get_matrix_nexus

python get_matrix_nexus.py

cp FWM_matrix_ALGs_porifera.nex ../../../results/FWM_matrix_ALGs_porifera.nex

cd $project_root
