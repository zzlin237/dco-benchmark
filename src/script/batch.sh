#!/bin/bash

ORIGINAL_DIR=$(pwd)
cd ../../build/src
##########################################
dataset="deep1b"                                                    #**
K=20                                                             # 20, 100
rotation="P"
dataset_path="/home/zzlin/dataset/${dataset}/${rotation}deep1b_base.fvecs"     #**
query_path="/home/zzlin/dataset/${dataset}/query.public.10K.fbin"           #**
ground_truth_path="/home/zzlin/dataset/${dataset}/gt_256.ivecs"
operator=4                                                       #**
index_path="/home/zzlin/dataset/${dataset}/hnsw_${rotation}${dataset}_M16_efConstruction500_operator0.index"
log_file="${ORIGINAL_DIR}/log3/hnsw_${dataset}_K${K}_operator${operator}_search_log_test1.txt"
./hnsw_search -k ${K} -n ${dataset_path} -q ${query_path} -g ${ground_truth_path} -i ${index_path} -o ${operator} > ${log_file} 2>&1

if [ $? -ne 0 ]; then
    echo "${dataset} HNSW Search FAIL"
    exit 1
fi

##########################################
dataset="deep1b"                                                    #**
K=100                                                             # 20, 100
rotation="P"
dataset_path="/home/zzlin/dataset/${dataset}/${rotation}deep1b_base.fvecs"     #**
query_path="/home/zzlin/dataset/${dataset}/query.public.10K.fbin"           #**
ground_truth_path="/home/zzlin/dataset/${dataset}/gt_256.ivecs"
operator=4                                                       #**
index_path="/home/zzlin/dataset/${dataset}/hnsw_${rotation}${dataset}_M16_efConstruction500_operator0.index"
log_file="${ORIGINAL_DIR}/log3/hnsw_${dataset}_K${K}_operator${operator}_search_log_test1.txt"
./hnsw_search -k ${K} -n ${dataset_path} -q ${query_path} -g ${ground_truth_path} -i ${index_path} -o ${operator} > ${log_file} 2>&1

if [ $? -ne 0 ]; then
    echo "${dataset} HNSW Search FAIL"
    exit 1
fi

##########################################
dataset="OpenAIArXiv"                                                    #**
K=20                                                             # 20, 100
rotation="P"
dataset_path="/home/zzlin/dataset/${dataset}/${rotation}OpenAIArXiv_base.fvecs"     #**
query_path="/home/zzlin/dataset/${dataset}/openai_query.bin"           #**
ground_truth_path="/home/zzlin/dataset/${dataset}/gt_256.ivecs"
operator=4                                                       #**
index_path="/home/zzlin/dataset/${dataset}/hnsw_${rotation}${dataset}_M16_efConstruction500_operator0.index"
log_file="${ORIGINAL_DIR}/log3/hnsw_${dataset}_K${K}_operator${operator}_search_log_test1.txt"
./hnsw_search -k ${K} -n ${dataset_path} -q ${query_path} -g ${ground_truth_path} -i ${index_path} -o ${operator} > ${log_file} 2>&1

if [ $? -ne 0 ]; then
    echo "${dataset} HNSW Search FAIL"
    exit 1
fi

##########################################
dataset="OpenAIArXiv"                                                    #**
K=100                                                             # 20, 100
rotation="P"
dataset_path="/home/zzlin/dataset/${dataset}/${rotation}OpenAIArXiv_base.fvecs"     #**
query_path="/home/zzlin/dataset/${dataset}/openai_query.bin"           #**
ground_truth_path="/home/zzlin/dataset/${dataset}/gt_256.ivecs"
operator=4                                                       #**
index_path="/home/zzlin/dataset/${dataset}/hnsw_${rotation}${dataset}_M16_efConstruction500_operator0.index"
log_file="${ORIGINAL_DIR}/log3/hnsw_${dataset}_K${K}_operator${operator}_search_log_test1.txt"
./hnsw_search -k ${K} -n ${dataset_path} -q ${query_path} -g ${ground_truth_path} -i ${index_path} -o ${operator} > ${log_file} 2>&1

if [ $? -ne 0 ]; then
    echo "${dataset} HNSW Search FAIL"
    exit 1
fi
##########################################
dataset="sift"                                                    #**
K=20                                                             # 20, 100
rotation="P"
dataset_path="/home/zzlin/dataset/${dataset}/${rotation}sift_base.fvecs"     #**
query_path="/home/zzlin/dataset/${dataset}/query.fvecs"           #**
ground_truth_path="/home/zzlin/dataset/${dataset}/gt_256.ivecs"
operator=4                                                       #**
index_path="/home/zzlin/dataset/${dataset}/hnsw_${rotation}${dataset}_M16_efConstruction500_operator0.index"
log_file="${ORIGINAL_DIR}/log3/hnsw_${dataset}_K${K}_operator${operator}_search_log_test1.txt"
./hnsw_search -k ${K} -n ${dataset_path} -q ${query_path} -g ${ground_truth_path} -i ${index_path} -o ${operator} > ${log_file} 2>&1

if [ $? -ne 0 ]; then
    echo "${dataset} HNSW Search FAIL"
    exit 1
fi
##########################################
dataset="sift"                                                    #**
K=100                                                             # 20, 100
rotation="P"
dataset_path="/home/zzlin/dataset/${dataset}/${rotation}sift_base.fvecs"     #**
query_path="/home/zzlin/dataset/${dataset}/query.fvecs"           #**
ground_truth_path="/home/zzlin/dataset/${dataset}/gt_256.ivecs"
operator=4                                                       #**
index_path="/home/zzlin/dataset/${dataset}/hnsw_${rotation}${dataset}_M16_efConstruction500_operator0.index"
log_file="${ORIGINAL_DIR}/log3/hnsw_${dataset}_K${K}_operator${operator}_search_log_test1.txt"
./hnsw_search -k ${K} -n ${dataset_path} -q ${query_path} -g ${ground_truth_path} -i ${index_path} -o ${operator} > ${log_file} 2>&1

if [ $? -ne 0 ]; then
    echo "${dataset} HNSW Search FAIL"
    exit 1
fi
##########################################
dataset="gist"                                                    #**
K=20                                                             # 20, 100
rotation="P"
dataset_path="/home/zzlin/dataset/${dataset}/${rotation}gist_base.fvecs"     #**
query_path="/home/zzlin/dataset/${dataset}/query.fvecs"           #**
ground_truth_path="/home/zzlin/dataset/${dataset}/gt_256.ivecs"
operator=4                                                       #**
index_path="/home/zzlin/dataset/${dataset}/hnsw_${rotation}${dataset}_M16_efConstruction500_operator0.index"
log_file="${ORIGINAL_DIR}/log3/hnsw_${dataset}_K${K}_operator${operator}_search_log_test1.txt"
./hnsw_search -k ${K} -n ${dataset_path} -q ${query_path} -g ${ground_truth_path} -i ${index_path} -o ${operator} > ${log_file} 2>&1

if [ $? -ne 0 ]; then
    echo "${dataset} HNSW Search FAIL"
    exit 1
fi
##########################################
dataset="gist"                                                    #**
K=100                                                             # 20, 100
rotation="P"
dataset_path="/home/zzlin/dataset/${dataset}/${rotation}gist_base.fvecs"     #**
query_path="/home/zzlin/dataset/${dataset}/query.fvecs"           #**
ground_truth_path="/home/zzlin/dataset/${dataset}/gt_256.ivecs"
operator=4                                                       #**
index_path="/home/zzlin/dataset/${dataset}/hnsw_${rotation}${dataset}_M16_efConstruction500_operator0.index"
log_file="${ORIGINAL_DIR}/log3/hnsw_${dataset}_K${K}_operator${operator}_search_log_test1.txt"
./hnsw_search -k ${K} -n ${dataset_path} -q ${query_path} -g ${ground_truth_path} -i ${index_path} -o ${operator} > ${log_file} 2>&1

if [ $? -ne 0 ]; then
    echo "${dataset} HNSW Search FAIL"
    exit 1
fi
##########################################
dataset="trevi"                                                    #**
K=20                                                             # 20, 100
rotation="P"
dataset_path="/home/zzlin/dataset/${dataset}/${rotation}trevi_base.fvecs"     #**
query_path="/home/zzlin/dataset/${dataset}/query.fvecs"           #**
ground_truth_path="/home/zzlin/dataset/${dataset}/gt_256.ivecs"
operator=4                                                       #**
index_path="/home/zzlin/dataset/${dataset}/hnsw_${rotation}${dataset}_M16_efConstruction500_operator0.index"
log_file="${ORIGINAL_DIR}/log3/hnsw_${dataset}_K${K}_operator${operator}_search_log_test1.txt"
./hnsw_search -k ${K} -n ${dataset_path} -q ${query_path} -g ${ground_truth_path} -i ${index_path} -o ${operator} > ${log_file} 2>&1

if [ $? -ne 0 ]; then
    echo "${dataset} HNSW Search FAIL"
    exit 1
fi
##########################################
dataset="trevi"                                                    #**
K=100                                                             # 20, 100
rotation="P"
dataset_path="/home/zzlin/dataset/${dataset}/${rotation}trevi_base.fvecs"     #**
query_path="/home/zzlin/dataset/${dataset}/query.fvecs"           #**
ground_truth_path="/home/zzlin/dataset/${dataset}/gt_256.ivecs"
operator=4                                                       #**
index_path="/home/zzlin/dataset/${dataset}/hnsw_${rotation}${dataset}_M16_efConstruction500_operator0.index"
log_file="${ORIGINAL_DIR}/log3/hnsw_${dataset}_K${K}_operator${operator}_search_log_test1.txt"
./hnsw_search -k ${K} -n ${dataset_path} -q ${query_path} -g ${ground_truth_path} -i ${index_path} -o ${operator} > ${log_file} 2>&1

if [ $? -ne 0 ]; then
    echo "${dataset} HNSW Search FAIL"
    exit 1
fi

cd "$ORIGINAL_DIR"