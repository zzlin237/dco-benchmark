#!/bin/bash

ORIGINAL_DIR=$(pwd)
cd ../../build/GroundTruth
dataset="sift"
K=256
dataset_path="/home/zzlin/dataset/${dataset}/sift_base.fvecs"
query_path="/home/zzlin/dataset/${dataset}/query.fvecs"
ground_truth_path="/home/zzlin/dataset/${dataset}/gt_${K}.ivecs"
metric=0  # 0: L2, 1: IP

./check_result -k ${K} -n ${dataset_path} -q ${query_path} -g ${ground_truth_path} -m ${metric}

if [ $? -ne 0 ]; then
    echo "${dataset} CHECK FAIL"
    exit 1
fi

cd "$ORIGINAL_DIR"