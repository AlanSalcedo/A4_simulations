#!/bin/bash

#load in variables
st=$1
config=$2
sim_run=$3
setup=/home/alansalgo/A4_simulations/setup_files/noise_setup/setup_A${st}_C${config}.txt
user_path=/misc/disk19/users/   #ASK!!!
if [ -d "$user_path" ]; then
    echo "There is ${user_path}"
else
    echo "Switch to /data/user/"
    user_path=/data/user/
fi
result=${user_path}alansalgo/batch_run_A4_sim_test/data_test

if [ -d "$result" ]; then
    echo "There is ${result}"
else
    echo "Make ${result}"
    mkdir ${result}
fi

# run the reconstruction script
#export HDF5_USE_FILE_LOCKING='FALSE'
source /home/alansalgo/config_ARA_A4.sh #This loads my local version of AraRoot. Comment it and uncomment the line below to use the cvmfs version.
#source /cvmfs/ara.opensciencegrid.org/trunk/centos7/setup.sh
#source /home/mkim/analysis/MF_filters/setup.sh
cd /home/alansalgo/A4_simulations/AraSim/

./AraSim ${setup} ${sim_run} $TMPDIR

# at the end, move the results back
mv $TMPDIR/*.root ${result}
