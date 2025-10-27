#!/bin/bash

ORIGINAL_DIR=$(pwd)
cd ../../build/src || exit
################################################
dataset="sift"                                                    #**
K=100                                                             # 20, 100
rotation="P"
dataset_path="/home/zzlin/dataset/${dataset}/${rotation}sift_base.fvecs"     #**
query_path="/home/zzlin/dataset/${dataset}/query.fvecs"           #**
ground_truth_path="/home/zzlin/dataset/${dataset}/gt_256.ivecs"
operator=4                                                        #**
index_path="/home/zzlin/dataset/${dataset}/ivf_${rotation}${dataset}_C4096_operator0.index"
log_file="${ORIGINAL_DIR}/log3/ivf_${dataset}_K${K}_operator${operator}_search_log_test1_NO_SIMD.txt"
./ivf_search -k ${K} -n ${dataset_path} -q ${query_path} -g ${ground_truth_path} -i ${index_path} -o ${operator} > ${log_file} 2>&1

if [ $? -ne 0 ]; then
    echo "${dataset} ivf Search FAIL"
    exit 1
fi
################################################
dataset="gist"                                                    #**
K=100                                                             # 20, 100
rotation="P"
dataset_path="/home/zzlin/dataset/${dataset}/${rotation}sift_base.fvecs"     #**
query_path="/home/zzlin/dataset/${dataset}/query.fvecs"           #**
ground_truth_path="/home/zzlin/dataset/${dataset}/gt_256.ivecs"
operator=4                                                        #**
index_path="/home/zzlin/dataset/${dataset}/ivf_${rotation}${dataset}_C4096_operator0.index"
log_file="${ORIGINAL_DIR}/log3/ivf_${dataset}_K${K}_operator${operator}_search_log_test1_NO_SIMD.txt"
./ivf_search -k ${K} -n ${dataset_path} -q ${query_path} -g ${ground_truth_path} -i ${index_path} -o ${operator} > ${log_file} 2>&1

if [ $? -ne 0 ]; then
    echo "${dataset} ivf Search FAIL"
    exit 1
fi

cd "$ORIGINAL_DIR" || exit