#!/bin/bash

ORIGINAL_DIR=$(pwd)
cd ../../build/Construction
#dataset="OpenAIArXiv"
#rotation=""
#M=16
#efConstruction=500
#operator=1
#dataset_path="/home/zzlin/dataset/${dataset}/${rotation}openai_base.bin"
#index_path="/home/zzlin/dataset/${dataset}/hnsw_${rotation}${dataset}_M${M}_efConstruction${efConstruction}_operator${operator}.index"
#log_file="${ORIGINAL_DIR}/log2/hnsw_${rotation}${dataset}_M${M}_efConstruction${efConstruction}_operator${operator}_log.txt"
#
#./hnsw_index -m ${M} -e ${efConstruction} -o ${operator} -n ${dataset_path} -i ${index_path} > ${log_file} 2>&1
#
#if [ $? -ne 0 ]; then
#    echo "${dataset} Build HNSW1 Index FAIL"
#    exit 1
#fi

############################################
#rotation="P"
#operator=2
#dataset_path="/home/zzlin/dataset/${dataset}/${rotation}OpenAIArXiv_base.fvecs"
#index_path="/home/zzlin/dataset/${dataset}/hnsw_${rotation}${dataset}_M${M}_efConstruction${efConstruction}_operator${operator}.index"
#log_file="${ORIGINAL_DIR}/log2/hnsw_${rotation}${dataset}_M${M}_efConstruction${efConstruction}_operator${operator}_log.txt"
#
#./hnsw_index -m ${M} -e ${efConstruction} -o ${operator} -n ${dataset_path} -i ${index_path} > ${log_file} 2>&1
#
#if [ $? -ne 0 ]; then
#    echo "${dataset} Build HNSW2 Index FAIL"
#    exit 1
#fi
#############################################
#rotation="P"
#operator=4
#dataset_path="/home/zzlin/dataset/${dataset}/${rotation}OpenAIArXiv_base.fvecs"
#index_path="/home/zzlin/dataset/${dataset}/hnsw_${rotation}${dataset}_M${M}_efConstruction${efConstruction}_operator${operator}.index"
#log_file="${ORIGINAL_DIR}/log2/hnsw_${rotation}${dataset}_M${M}_efConstruction${efConstruction}_operator${operator}_log.txt"
#
#./hnsw_index -m ${M} -e ${efConstruction} -o ${operator} -n ${dataset_path} -i ${index_path} > ${log_file} 2>&1
#
#if [ $? -ne 0 ]; then
#    echo "${dataset} Build HNSW3 Index FAIL"
#    exit 1
#fi
#############################################
#rotation="O"
#operator=3
#dataset_path="/home/zzlin/dataset/${dataset}/${rotation}OpenAIArXiv_base.fvecs"
#index_path="/home/zzlin/dataset/${dataset}/hnsw_${rotation}${dataset}_M${M}_efConstruction${efConstruction}_operator${operator}.index"
#log_file="${ORIGINAL_DIR}/log2/hnsw_${rotation}${dataset}_M${M}_efConstruction${efConstruction}_operator${operator}_log.txt"
#
#./hnsw_index -m ${M} -e ${efConstruction} -o ${operator} -n ${dataset_path} -i ${index_path} > ${log_file} 2>&1
#
#if [ $? -ne 0 ]; then
#    echo "${dataset} Build HNSW4 Index FAIL"
#    exit 1
#fi
#############################################
dataset="glove100"
M=16
efConstruction=500
rotation=""
operator=0
dataset_path="/home/zzlin/dataset/${dataset}/${rotation}glove100.bin"
index_path="/home/zzlin/dataset/${dataset}/hnsw_${rotation}${dataset}_M${M}_efConstruction${efConstruction}_operator${operator}.index"
log_file="${ORIGINAL_DIR}/log2/hnsw_${rotation}${dataset}_M${M}_efConstruction${efConstruction}_operator${operator}_log.txt"

./hnsw_index -m ${M} -e ${efConstruction} -o ${operator} -n ${dataset_path} -i ${index_path} > ${log_file} 2>&1

if [ $? -ne 0 ]; then
    echo "${dataset} Build HNSW5 Index FAIL"
    exit 1
fi
#############################################
rotation=""
operator=1
dataset_path="/home/zzlin/dataset/${dataset}/${rotation}glove100.bin"
index_path="/home/zzlin/dataset/${dataset}/hnsw_${rotation}${dataset}_M${M}_efConstruction${efConstruction}_operator${operator}.index"
log_file="${ORIGINAL_DIR}/log2/hnsw_${rotation}${dataset}_M${M}_efConstruction${efConstruction}_operator${operator}_log.txt"

./hnsw_index -m ${M} -e ${efConstruction} -o ${operator} -n ${dataset_path} -i ${index_path} > ${log_file} 2>&1

if [ $? -ne 0 ]; then
    echo "${dataset} Build HNSW6 Index FAIL"
    exit 1
fi
#############################################
rotation="P"
operator=2
dataset_path="/home/zzlin/dataset/${dataset}/${rotation}glove100_base.fvecs"
index_path="/home/zzlin/dataset/${dataset}/hnsw_${rotation}${dataset}_M${M}_efConstruction${efConstruction}_operator${operator}.index"
log_file="${ORIGINAL_DIR}/log2/hnsw_${rotation}${dataset}_M${M}_efConstruction${efConstruction}_operator${operator}_log.txt"

./hnsw_index -m ${M} -e ${efConstruction} -o ${operator} -n ${dataset_path} -i ${index_path} > ${log_file} 2>&1

if [ $? -ne 0 ]; then
    echo "${dataset} Build HNSW7 Index FAIL"
    exit 1
fi
#############################################
rotation="P"
operator=4
dataset_path="/home/zzlin/dataset/${dataset}/${rotation}glove100_base.fvecs"
index_path="/home/zzlin/dataset/${dataset}/hnsw_${rotation}${dataset}_M${M}_efConstruction${efConstruction}_operator${operator}.index"
log_file="${ORIGINAL_DIR}/log2/hnsw_${rotation}${dataset}_M${M}_efConstruction${efConstruction}_operator${operator}_log.txt"

./hnsw_index -m ${M} -e ${efConstruction} -o ${operator} -n ${dataset_path} -i ${index_path} > ${log_file} 2>&1

if [ $? -ne 0 ]; then
    echo "${dataset} Build HNSW8 Index FAIL"
    exit 1
fi
#############################################
rotation="O"
operator=3
dataset_path="/home/zzlin/dataset/${dataset}/${rotation}glove100_base.fvecs"
index_path="/home/zzlin/dataset/${dataset}/hnsw_${rotation}${dataset}_M${M}_efConstruction${efConstruction}_operator${operator}.index"
log_file="${ORIGINAL_DIR}/log2/hnsw_${rotation}${dataset}_M${M}_efConstruction${efConstruction}_operator${operator}_log.txt"

./hnsw_index -m ${M} -e ${efConstruction} -o ${operator} -n ${dataset_path} -i ${index_path} > ${log_file} 2>&1

if [ $? -ne 0 ]; then
    echo "${dataset} Build HNSW9 Index FAIL"
    exit 1
fi
#############################################
rotation="L"
operator=5
dataset_path="/home/zzlin/dataset/${dataset}/${rotation}glove100_base.fvecs"
index_path="/home/zzlin/dataset/${dataset}/hnsw_${rotation}${dataset}_M${M}_efConstruction${efConstruction}_operator${operator}.index"
log_file="${ORIGINAL_DIR}/log2/hnsw_${rotation}${dataset}_M${M}_efConstruction${efConstruction}_operator${operator}_log.txt"

./hnsw_index_ip -m ${M} -e ${efConstruction} -o ${operator} -n ${dataset_path} -i ${index_path} > ${log_file} 2>&1

if [ $? -ne 0 ]; then
    echo "${dataset} Build HNSW10 Index FAIL"
    exit 1
fi
#############################################
dataset="OpenAIArXiv"
M=16
efConstruction=500
rotation="L"
operator=5
dataset_path="/home/zzlin/dataset/${dataset}/${rotation}OpenAIArXiv_base.fvecs"
index_path="/home/zzlin/dataset/${dataset}/hnsw_${rotation}${dataset}_M${M}_efConstruction${efConstruction}_operator${operator}.index"
log_file="${ORIGINAL_DIR}/log2/hnsw_${rotation}${dataset}_M${M}_efConstruction${efConstruction}_operator${operator}_log.txt"

./hnsw_index_ip -m ${M} -e ${efConstruction} -o ${operator} -n ${dataset_path} -i ${index_path} > ${log_file} 2>&1

if [ $? -ne 0 ]; then
    echo "${dataset} Build HNSW5 Index FAIL"
    exit 1
fi
#############################################
rotation=""
operator=1
dataset_path="/home/zzlin/dataset/${dataset}/${rotation}gist_base.fvecs"
index_path="/home/zzlin/dataset/${dataset}/hnsw_${rotation}${dataset}_M${M}_efConstruction${efConstruction}_operator${operator}.index"
log_file="${ORIGINAL_DIR}/log2/hnsw_${rotation}${dataset}_M${M}_efConstruction${efConstruction}_operator${operator}_log.txt"

./hnsw_index -m ${M} -e ${efConstruction} -o ${operator} -n ${dataset_path} -i ${index_path} > ${log_file} 2>&1

if [ $? -ne 0 ]; then
    echo "${dataset} Build HNSW6 Index FAIL"
    exit 1
fi
#############################################
rotation="P"
operator=2
dataset_path="/home/zzlin/dataset/${dataset}/${rotation}gist_base.fvecs"
index_path="/home/zzlin/dataset/${dataset}/hnsw_${rotation}${dataset}_M${M}_efConstruction${efConstruction}_operator${operator}.index"
log_file="${ORIGINAL_DIR}/log2/hnsw_${rotation}${dataset}_M${M}_efConstruction${efConstruction}_operator${operator}_log.txt"

./hnsw_index -m ${M} -e ${efConstruction} -o ${operator} -n ${dataset_path} -i ${index_path} > ${log_file} 2>&1

if [ $? -ne 0 ]; then
    echo "${dataset} Build HNSW7 Index FAIL"
    exit 1
fi
#############################################
rotation="P"
operator=4
dataset_path="/home/zzlin/dataset/${dataset}/${rotation}gist_base.fvecs"
index_path="/home/zzlin/dataset/${dataset}/hnsw_${rotation}${dataset}_M${M}_efConstruction${efConstruction}_operator${operator}.index"
log_file="${ORIGINAL_DIR}/log2/hnsw_${rotation}${dataset}_M${M}_efConstruction${efConstruction}_operator${operator}_log.txt"

./hnsw_index -m ${M} -e ${efConstruction} -o ${operator} -n ${dataset_path} -i ${index_path} > ${log_file} 2>&1

if [ $? -ne 0 ]; then
    echo "${dataset} Build HNSW8 Index FAIL"
    exit 1
fi
#############################################
rotation="O"
operator=3
dataset_path="/home/zzlin/dataset/${dataset}/${rotation}gist_base.fvecs"
index_path="/home/zzlin/dataset/${dataset}/hnsw_${rotation}${dataset}_M${M}_efConstruction${efConstruction}_operator${operator}.index"
log_file="${ORIGINAL_DIR}/log2/hnsw_${rotation}${dataset}_M${M}_efConstruction${efConstruction}_operator${operator}_log.txt"

./hnsw_index -m ${M} -e ${efConstruction} -o ${operator} -n ${dataset_path} -i ${index_path} > ${log_file} 2>&1

if [ $? -ne 0 ]; then
    echo "${dataset} Build HNSW9 Index FAIL"
    exit 1
fi
#############################################
rotation="L"
operator=5
dataset_path="/home/zzlin/dataset/${dataset}/${rotation}gist_base.fvecs"
index_path="/home/zzlin/dataset/${dataset}/hnsw_${rotation}${dataset}_M${M}_efConstruction${efConstruction}_operator${operator}.index"
log_file="${ORIGINAL_DIR}/log2/hnsw_${rotation}${dataset}_M${M}_efConstruction${efConstruction}_operator${operator}_log.txt"

./hnsw_index_ip -m ${M} -e ${efConstruction} -o ${operator} -n ${dataset_path} -i ${index_path} > ${log_file} 2>&1

if [ $? -ne 0 ]; then
    echo "${dataset} Build HNSW10 Index FAIL"
    exit 1
fi
#############################################
rotation=""
operator=1
dataset_path="/home/zzlin/dataset/${dataset}/${rotation}trevi_base.fvecs"
index_path="/home/zzlin/dataset/${dataset}/hnsw_${rotation}${dataset}_M${M}_efConstruction${efConstruction}_operator${operator}.index"
log_file="${ORIGINAL_DIR}/log2/hnsw_${rotation}${dataset}_M${M}_efConstruction${efConstruction}_operator${operator}_log.txt"

./hnsw_index -m ${M} -e ${efConstruction} -o ${operator} -n ${dataset_path} -i ${index_path} > ${log_file} 2>&1

if [ $? -ne 0 ]; then
    echo "${dataset} Build HNSW11 Index FAIL"
    exit 1
fi
#############################################
rotation="P"
operator=2
dataset_path="/home/zzlin/dataset/${dataset}/${rotation}trevi_base.fvecs"
index_path="/home/zzlin/dataset/${dataset}/hnsw_${rotation}${dataset}_M${M}_efConstruction${efConstruction}_operator${operator}.index"
log_file="${ORIGINAL_DIR}/log2/hnsw_${rotation}${dataset}_M${M}_efConstruction${efConstruction}_operator${operator}_log.txt"

./hnsw_index -m ${M} -e ${efConstruction} -o ${operator} -n ${dataset_path} -i ${index_path} > ${log_file} 2>&1

if [ $? -ne 0 ]; then
    echo "${dataset} Build HNSW12 Index FAIL"
    exit 1
fi
#############################################
rotation="P"
operator=4
dataset_path="/home/zzlin/dataset/${dataset}/${rotation}trevi_base.fvecs"
index_path="/home/zzlin/dataset/${dataset}/hnsw_${rotation}${dataset}_M${M}_efConstruction${efConstruction}_operator${operator}.index"
log_file="${ORIGINAL_DIR}/log2/hnsw_${rotation}${dataset}_M${M}_efConstruction${efConstruction}_operator${operator}_log.txt"

./hnsw_index -m ${M} -e ${efConstruction} -o ${operator} -n ${dataset_path} -i ${index_path} > ${log_file} 2>&1

if [ $? -ne 0 ]; then
    echo "${dataset} Build HNSW13 Index FAIL"
    exit 1
fi
#############################################
rotation="O"
operator=3
dataset_path="/home/zzlin/dataset/${dataset}/${rotation}trevi_base.fvecs"
index_path="/home/zzlin/dataset/${dataset}/hnsw_${rotation}${dataset}_M${M}_efConstruction${efConstruction}_operator${operator}.index"
log_file="${ORIGINAL_DIR}/log2/hnsw_${rotation}${dataset}_M${M}_efConstruction${efConstruction}_operator${operator}_log.txt"

./hnsw_index -m ${M} -e ${efConstruction} -o ${operator} -n ${dataset_path} -i ${index_path} > ${log_file} 2>&1

if [ $? -ne 0 ]; then
    echo "${dataset} Build HNSW14 Index FAIL"
    exit 1
fi
#############################################
rotation="L"
operator=5
dataset_path="/home/zzlin/dataset/${dataset}/${rotation}trevi_base.fvecs"
index_path="/home/zzlin/dataset/${dataset}/hnsw_${rotation}${dataset}_M${M}_efConstruction${efConstruction}_operator${operator}.index"
log_file="${ORIGINAL_DIR}/log2/hnsw_${rotation}${dataset}_M${M}_efConstruction${efConstruction}_operator${operator}_log.txt"

./hnsw_index_ip -m ${M} -e ${efConstruction} -o ${operator} -n ${dataset_path} -i ${index_path} > ${log_file} 2>&1

if [ $? -ne 0 ]; then
    echo "${dataset} Build HNSW15 Index FAIL"
    exit 1
fi

cd "$ORIGINAL_DIR" ||  exit