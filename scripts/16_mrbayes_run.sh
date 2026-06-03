#!/bin/bash
# mrbayes run

project_root=$(pwd)
mkdir -p analysis/mrbayes_run/16_mrbayes_run
cd analysis/mrbayes_run/16_mrbayes_run

cat analysis/odp_run/15_get_matrix_nexus/FWM_matrix_ALGs_porifera.nex configs/16_mrbayes_parametrs > FWM_matrix_ALGs_porifera_mrbayes.nex

mb FWM_matrix_ALGs_porifera_mrbayes.nex

cp FWM_matrix_ALGs_porifera_mrbayes.nex.con.tre ../../../results/FWM_matrix_ALGs_porifera_mrbayes.nex.con.tre

cd $project_root
