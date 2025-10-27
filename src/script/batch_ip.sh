#!/bin/bash

ORIGINAL_DIR=$(pwd)
cd ../../build/src || exit                                                   #**
K=100                                                             # 20, 100
rotation="P"
operator=12
#######################################################
dataset="wiki"
dataset_path="/home/zzlin/dataset/${dataset}/${rotation}wiki_base.fvecs"     #**
query_path="/home/zzlin/dataset/${dataset}/wikipedia_query.bin"           #**
ground_truth_path="/home/zzlin/dataset/${dataset}/gt_256_ip.ivecs"                                                      #**
index_path="/home/zzlin/dataset/${dataset}/hnsw_norm_${rotation}${dataset}_M16_efConstruction500_operator8.index"
#index_path="/home/zzlin/dataset/${dataset}/hnsw_${rotation}${dataset}_M16_efConstruction500_operator8.index"
log_file="${ORIGINAL_DIR}/log3/hnsw_${dataset}_K${K}_operator${operator}_search_ip_log.txt"
./hnsw_search -k ${K} -n ${dataset_path} -q ${query_path} -g ${ground_truth_path} -i ${index_path} -o ${operator} > ${log_file} 2>&1

if [ $? -ne 0 ]; then
    echo "${dataset} HNSW Search FAIL"
    exit 1
fi

#######################################################
dataset="glove100"
dataset_path="/home/zzlin/dataset/${dataset}/${rotation}glove100_base.fvecs"     #**
query_path="/home/zzlin/dataset/${dataset}/query.fvecs"           #**
ground_truth_path="/home/zzlin/dataset/${dataset}/gt_256_ip.ivecs"                                                      #**
index_path="/home/zzlin/dataset/${dataset}/hnsw_norm_${rotation}${dataset}_M16_efConstruction500_operator8.index"
#index_path="/home/zzlin/dataset/${dataset}/hnsw_${rotation}${dataset}_M16_efConstruction500_operator8.index"
log_file="${ORIGINAL_DIR}/log3/hnsw_${dataset}_K${K}_operator${operator}_search_ip_log.txt"
./hnsw_search -k ${K} -n ${dataset_path} -q ${query_path} -g ${ground_truth_path} -i ${index_path} -o ${operator} > ${log_file} 2>&1

if [ $? -ne 0 ]; then
    echo "${dataset} HNSW Search FAIL"
    exit 1
fi

#######################################################
dataset="OpenAIArXiv"
dataset_path="/home/zzlin/dataset/${dataset}/${rotation}OpenAIArXiv_base.fvecs"     #**
query_path="/home/zzlin/dataset/${dataset}/openai_query.bin"           #**
ground_truth_path="/home/zzlin/dataset/${dataset}/gt_256_ip.ivecs"                                                      #**
index_path="/home/zzlin/dataset/${dataset}/hnsw_norm_${rotation}${dataset}_M16_efConstruction500_operator8.index"
#index_path="/home/zzlin/dataset/${dataset}/hnsw_${rotation}${dataset}_M16_efConstruction500_operator8.index"
log_file="${ORIGINAL_DIR}/log3/hnsw_${dataset}_K${K}_operator${operator}_search_ip_log.txt"
./hnsw_search -k ${K} -n ${dataset_path} -q ${query_path} -g ${ground_truth_path} -i ${index_path} -o ${operator} > ${log_file} 2>&1

if [ $? -ne 0 ]; then
    echo "${dataset} HNSW Search FAIL"
    exit 1
fi

#######################################################
dataset="msmacro"
dataset_path="/home/zzlin/dataset/${dataset}/${rotation}msmacro_base.fvecs"     #**
query_path="/home/zzlin/dataset/${dataset}/query.bin"           #**
ground_truth_path="/home/zzlin/dataset/${dataset}/gt_256_ip.ivecs"                                                      #**
index_path="/home/zzlin/dataset/${dataset}/hnsw_norm_${rotation}${dataset}_M16_efConstruction500_operator8.index"
#index_path="/home/zzlin/dataset/${dataset}/hnsw_${rotation}${dataset}_M16_efConstruction500_operator8.index"
log_file="${ORIGINAL_DIR}/log3/hnsw_${dataset}_K${K}_operator${operator}_search_ip_log.txt"
./hnsw_search -k ${K} -n ${dataset_path} -q ${query_path} -g ${ground_truth_path} -i ${index_path} -o ${operator} > ${log_file} 2>&1

if [ $? -ne 0 ]; then
    echo "${dataset} HNSW Search FAIL"
    exit 1
fi

cd "$ORIGINAL_DIR" ||  exit