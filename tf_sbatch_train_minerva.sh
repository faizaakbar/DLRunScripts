#!/bin/bash

SCRIPTKEY=`date +%s`
CONFIGFILE=Configs/tf_mnv_st_epsilon_wilson_cluster_training_ABG.cfg
CONFIGFILE=Configs/tf_mnv_st_epsilon_wilson_cluster_training.cfg
CONFIGFILE=Configs/tf_mnv_st_epsilon_wilson_cluster_prediction.cfg
CONFIGFILE=Configs/tf_mnv_st_epsilon_wilson_cluster_testing.cfg
python mnv_tf_script_gen.py $CONFIGFILE $SCRIPTKEY

NGPU=1
NODES=gpu2
NODES=gpu4

# show what we will do...
cat << EOF
sbatch --gres=gpu:${NGPU} --nodelist=${NODES} job${SCRIPTKEY}.sh
EOF

# do the thing, etc.
pushd job${SCRIPTKEY}
# cat job${SCRIPTKEY}.sh >& job_log.txt
sbatch --gres=gpu:${NGPU} --nodelist=${NODES} job${SCRIPTKEY}.sh
popd

