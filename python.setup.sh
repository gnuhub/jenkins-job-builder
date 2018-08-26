#!/usr/bin/env bash
set -x
if [ ! -d /Volumes/data/anaconda/envs/py3.3_for_jenkins_job_builder ];then
  conda create -y -n py3.3_for_jenkins_job_builder python=3.3
fi

source activate py3.3_for_jenkins_job_builder

pip install -r requirements.txt
#pip install -r test-requirements.txt
python setup.py develop
PYTHONPATH=`pwd` jenkins-jobs test tests/jsonparser/fixtures/simple.json