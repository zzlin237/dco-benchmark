#!/bin/bash

ORIGINAL_DIR=$(pwd)
cd ../../build/GroundTruth
dataset="OpenAIArXiv"
K=256
dataset_path="/home/zzlin/dataset/${dataset}/openai_base.bin"
query_path="/home/zzlin/dataset/${dataset}/openai_query.bin"
ground_truth_path="/home/zzlin/dataset/${dataset}/gt_${K}.ivecs"
metric=0  # 0: L2, 1: IP
log_file="${ORIGINAL_DIR}/log/${dataset}_gt_${K}_log.txt"

./generate_ground_truth -k ${K} -n ${dataset_path} -q ${query_path} -g ${ground_truth_path} -m ${metric}  > ${log_file} 2>&1

if [ $? -ne 0 ]; then
    echo "${dataset} Generate Ground Truth FAIL"
    exit 1
fi

cd "$ORIGINAL_DIR"