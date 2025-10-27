#!/bin/bash

ORIGINAL_DIR=$(pwd)
cd ../../build/src
############################################
dataset="laion"                                                    #**
K=100                                                             # 20, 100
rotation=""
dataset_path="/home/zzlin/dataset/${dataset}/${rotation}laion_base.fvecs"     #**
query_path="/home/zzlin/dataset/${dataset}/query_img.fvecs"           #**
ground_truth_path="/home/zzlin/dataset/${dataset}/gt_img_img_256.ivecs"
operator=0                                                       #**
index_path="/home/zzlin/dataset/${dataset}/hnsw_${rotation}${dataset}_M16_efConstruction500_operator0.index"
log_file="${ORIGINAL_DIR}/log_ood/hnsw_${dataset}_K${K}_operator${operator}_search_log_id_test.txt"
./hnsw_search -k ${K} -n ${dataset_path} -q ${query_path} -g ${ground_truth_path} -i ${index_path} -o ${operator} > ${log_file} 2>&1

if [ $? -ne 0 ]; then
    echo "${dataset} HNSW Search FAIL"
    exit 1
fi

####################################################

dataset="laion"                                                    #**
K=100                                                             # 20, 100
rotation=""
dataset_path="/home/zzlin/dataset/${dataset}/${rotation}laion_base.fvecs"     #**
query_path="/home/zzlin/dataset/${dataset}/query_text.fvecs"           #**
ground_truth_path="/home/zzlin/dataset/${dataset}/gt_img_text_256.ivecs"
operator=0                                                       #**
index_path="/home/zzlin/dataset/${dataset}/hnsw_${rotation}${dataset}_M16_efConstruction500_operator0.index"
log_file="${ORIGINAL_DIR}/log_ood/hnsw_${dataset}_K${K}_operator${operator}_search_log_ood_test.txt"
./hnsw_search -k ${K} -n ${dataset_path} -q ${query_path} -g ${ground_truth_path} -i ${index_path} -o ${operator} > ${log_file} 2>&1

if [ $? -ne 0 ]; then
    echo "${dataset} HNSW Search FAIL"
    exit 1
fi

############################################
dataset="text2image"                                                    #**
K=100                                                             # 20, 100
rotation=""
dataset_path="/home/zzlin/dataset/${dataset}/${rotation}text2image_base.fvecs"     #**
query_path="/home/zzlin/dataset/${dataset}/query_rand.fvecs"           #**
ground_truth_path="/home/zzlin/dataset/${dataset}/gt_256_rand.ivecs"
operator=0                                                       #**
index_path="/home/zzlin/dataset/${dataset}/hnsw_${rotation}${dataset}_M16_efConstruction500_operator0.index"
log_file="${ORIGINAL_DIR}/log_ood/hnsw_${dataset}_K${K}_operator${operator}_search_log_id_test.txt"
./hnsw_search -k ${K} -n ${dataset_path} -q ${query_path} -g ${ground_truth_path} -i ${index_path} -o ${operator} > ${log_file} 2>&1

if [ $? -ne 0 ]; then
    echo "${dataset} HNSW Search FAIL"
    exit 1
fi

####################################################

dataset="text2image"                                                   #**
K=100                                                             # 20, 100
rotation=""
dataset_path="/home/zzlin/dataset/${dataset}/${rotation}text2image_base.fvecs"     #**
query_path="/home/zzlin/dataset/${dataset}/query.public.100K.fbin"           #**
ground_truth_path="/home/zzlin/dataset/${dataset}/gt_256.ivecs"
operator=0                                                       #**
index_path="/home/zzlin/dataset/${dataset}/hnsw_${rotation}${dataset}_M16_efConstruction500_operator0.index"
log_file="${ORIGINAL_DIR}/log_ood/hnsw_${dataset}_K${K}_operator${operator}_search_log_ood_test.txt"
./hnsw_search -k ${K} -n ${dataset_path} -q ${query_path} -g ${ground_truth_path} -i ${index_path} -o ${operator} > ${log_file} 2>&1

if [ $? -ne 0 ]; then
    echo "${dataset} HNSW Search FAIL"
    exit 1
fi
############################################
dataset="laion"                                                    #**
K=100                                                             # 20, 100
rotation=""
dataset_path="/home/zzlin/dataset/${dataset}/${rotation}laion_base.fvecs"     #**
query_path="/home/zzlin/dataset/${dataset}/query_img.fvecs"           #**
ground_truth_path="/home/zzlin/dataset/${dataset}/gt_img_img_256.ivecs"
operator=1                                                       #**
index_path="/home/zzlin/dataset/${dataset}/hnsw_${rotation}${dataset}_M16_efConstruction500_operator0.index"
log_file="${ORIGINAL_DIR}/log_ood/hnsw_${dataset}_K${K}_operator${operator}_search_log_id_test.txt"
./hnsw_search -k ${K} -n ${dataset_path} -q ${query_path} -g ${ground_truth_path} -i ${index_path} -o ${operator} > ${log_file} 2>&1

if [ $? -ne 0 ]; then
    echo "${dataset} HNSW Search FAIL"
    exit 1
fi

####################################################

dataset="laion"                                                    #**
K=100                                                             # 20, 100
rotation=""
dataset_path="/home/zzlin/dataset/${dataset}/${rotation}laion_base.fvecs"     #**
query_path="/home/zzlin/dataset/${dataset}/query_text.fvecs"           #**
ground_truth_path="/home/zzlin/dataset/${dataset}/gt_img_text_256.ivecs"
operator=1                                                       #**
index_path="/home/zzlin/dataset/${dataset}/hnsw_${rotation}${dataset}_M16_efConstruction500_operator0.index"
log_file="${ORIGINAL_DIR}/log_ood/hnsw_${dataset}_K${K}_operator${operator}_search_log_ood_test.txt"
./hnsw_search -k ${K} -n ${dataset_path} -q ${query_path} -g ${ground_truth_path} -i ${index_path} -o ${operator} > ${log_file} 2>&1

if [ $? -ne 0 ]; then
    echo "${dataset} HNSW Search FAIL"
    exit 1
fi

############################################
dataset="text2image"                                                    #**
K=100                                                             # 20, 100
rotation=""
dataset_path="/home/zzlin/dataset/${dataset}/${rotation}text2image_base.fvecs"     #**
query_path="/home/zzlin/dataset/${dataset}/query_rand.fvecs"           #**
ground_truth_path="/home/zzlin/dataset/${dataset}/gt_256_rand.ivecs"
operator=1                                                       #**
index_path="/home/zzlin/dataset/${dataset}/hnsw_${rotation}${dataset}_M16_efConstruction500_operator0.index"
log_file="${ORIGINAL_DIR}/log_ood/hnsw_${dataset}_K${K}_operator${operator}_search_log_id_test.txt"
./hnsw_search -k ${K} -n ${dataset_path} -q ${query_path} -g ${ground_truth_path} -i ${index_path} -o ${operator} > ${log_file} 2>&1

if [ $? -ne 0 ]; then
    echo "${dataset} HNSW Search FAIL"
    exit 1
fi

####################################################

dataset="text2image"                                                   #**
K=100                                                             # 20, 100
rotation=""
dataset_path="/home/zzlin/dataset/${dataset}/${rotation}text2image_base.fvecs"     #**
query_path="/home/zzlin/dataset/${dataset}/query.public.100K.fbin"           #**
ground_truth_path="/home/zzlin/dataset/${dataset}/gt_256.ivecs"
operator=1                                                       #**
index_path="/home/zzlin/dataset/${dataset}/hnsw_${rotation}${dataset}_M16_efConstruction500_operator0.index"
log_file="${ORIGINAL_DIR}/log_ood/hnsw_${dataset}_K${K}_operator${operator}_search_log_ood_test.txt"
./hnsw_search -k ${K} -n ${dataset_path} -q ${query_path} -g ${ground_truth_path} -i ${index_path} -o ${operator} > ${log_file} 2>&1

if [ $? -ne 0 ]; then
    echo "${dataset} HNSW Search FAIL"
    exit 1
fi
############################################
dataset="laion"                                                    #**
K=100                                                             # 20, 100
rotation="P"
dataset_path="/home/zzlin/dataset/${dataset}/${rotation}laion_base.fvecs"     #**
query_path="/home/zzlin/dataset/${dataset}/query_img.fvecs"           #**
ground_truth_path="/home/zzlin/dataset/${dataset}/gt_img_img_256.ivecs"
operator=2                                                       #**
index_path="/home/zzlin/dataset/${dataset}/hnsw_${rotation}${dataset}_M16_efConstruction500_operator0.index"
log_file="${ORIGINAL_DIR}/log_ood/hnsw_${dataset}_K${K}_operator${operator}_search_log_id_test.txt"
./hnsw_search -k ${K} -n ${dataset_path} -q ${query_path} -g ${ground_truth_path} -i ${index_path} -o ${operator} > ${log_file} 2>&1

if [ $? -ne 0 ]; then
    echo "${dataset} HNSW Search FAIL"
    exit 1
fi

####################################################

dataset="laion"                                                    #**
K=100                                                             # 20, 100
rotation="P"
dataset_path="/home/zzlin/dataset/${dataset}/${rotation}laion_base.fvecs"     #**
query_path="/home/zzlin/dataset/${dataset}/query_text.fvecs"           #**
ground_truth_path="/home/zzlin/dataset/${dataset}/gt_img_text_256.ivecs"
operator=2                                                       #**
index_path="/home/zzlin/dataset/${dataset}/hnsw_${rotation}${dataset}_M16_efConstruction500_operator0.index"
log_file="${ORIGINAL_DIR}/log_ood/hnsw_${dataset}_K${K}_operator${operator}_search_log_ood_test.txt"
./hnsw_search -k ${K} -n ${dataset_path} -q ${query_path} -g ${ground_truth_path} -i ${index_path} -o ${operator} > ${log_file} 2>&1

if [ $? -ne 0 ]; then
    echo "${dataset} HNSW Search FAIL"
    exit 1
fi

############################################
dataset="text2image"                                                    #**
K=100                                                             # 20, 100
rotation="P"
dataset_path="/home/zzlin/dataset/${dataset}/${rotation}text2image_base.fvecs"     #**
query_path="/home/zzlin/dataset/${dataset}/query_rand.fvecs"           #**
ground_truth_path="/home/zzlin/dataset/${dataset}/gt_256_rand.ivecs"
operator=2                                                       #**
index_path="/home/zzlin/dataset/${dataset}/hnsw_${rotation}${dataset}_M16_efConstruction500_operator0.index"
log_file="${ORIGINAL_DIR}/log_ood/hnsw_${dataset}_K${K}_operator${operator}_search_log_id_test.txt"
./hnsw_search -k ${K} -n ${dataset_path} -q ${query_path} -g ${ground_truth_path} -i ${index_path} -o ${operator} > ${log_file} 2>&1

if [ $? -ne 0 ]; then
    echo "${dataset} HNSW Search FAIL"
    exit 1
fi

####################################################

dataset="text2image"                                                   #**
K=100                                                             # 20, 100
rotation="P"
dataset_path="/home/zzlin/dataset/${dataset}/${rotation}text2image_base.fvecs"     #**
query_path="/home/zzlin/dataset/${dataset}/query.public.100K.fbin"           #**
ground_truth_path="/home/zzlin/dataset/${dataset}/gt_256.ivecs"
operator=2                                                       #**
index_path="/home/zzlin/dataset/${dataset}/hnsw_${rotation}${dataset}_M16_efConstruction500_operator0.index"
log_file="${ORIGINAL_DIR}/log_ood/hnsw_${dataset}_K${K}_operator${operator}_search_log_ood_test.txt"
./hnsw_search -k ${K} -n ${dataset_path} -q ${query_path} -g ${ground_truth_path} -i ${index_path} -o ${operator} > ${log_file} 2>&1

if [ $? -ne 0 ]; then
    echo "${dataset} HNSW Search FAIL"
    exit 1
fi

############################################
dataset="laion"                                                    #**
K=100                                                             # 20, 100
rotation="P"
dataset_path="/home/zzlin/dataset/${dataset}/${rotation}laion_base.fvecs"     #**
query_path="/home/zzlin/dataset/${dataset}/query_img.fvecs"           #**
ground_truth_path="/home/zzlin/dataset/${dataset}/gt_img_img_256.ivecs"
operator=4                                                       #**
index_path="/home/zzlin/dataset/${dataset}/hnsw_${rotation}${dataset}_M16_efConstruction500_operator0.index"
log_file="${ORIGINAL_DIR}/log_ood/hnsw_${dataset}_K${K}_operator${operator}_search_log_id_test.txt"
./hnsw_search -k ${K} -n ${dataset_path} -q ${query_path} -g ${ground_truth_path} -i ${index_path} -o ${operator} > ${log_file} 2>&1

if [ $? -ne 0 ]; then
    echo "${dataset} HNSW Search FAIL"
    exit 1
fi

####################################################

dataset="laion"                                                    #**
K=100                                                             # 20, 100
rotation="P"
dataset_path="/home/zzlin/dataset/${dataset}/${rotation}laion_base.fvecs"     #**
query_path="/home/zzlin/dataset/${dataset}/query_text.fvecs"           #**
ground_truth_path="/home/zzlin/dataset/${dataset}/gt_img_text_256.ivecs"
operator=4                                                       #**
index_path="/home/zzlin/dataset/${dataset}/hnsw_${rotation}${dataset}_M16_efConstruction500_operator0.index"
log_file="${ORIGINAL_DIR}/log_ood/hnsw_${dataset}_K${K}_operator${operator}_search_log_ood_test.txt"
./hnsw_search -k ${K} -n ${dataset_path} -q ${query_path} -g ${ground_truth_path} -i ${index_path} -o ${operator} > ${log_file} 2>&1

if [ $? -ne 0 ]; then
    echo "${dataset} HNSW Search FAIL"
    exit 1
fi

############################################
dataset="text2image"                                                    #**
K=100                                                             # 20, 100
rotation="P"
dataset_path="/home/zzlin/dataset/${dataset}/${rotation}text2image_base.fvecs"     #**
query_path="/home/zzlin/dataset/${dataset}/query_rand.fvecs"           #**
ground_truth_path="/home/zzlin/dataset/${dataset}/gt_256_rand.ivecs"
operator=4                                                       #**
index_path="/home/zzlin/dataset/${dataset}/hnsw_${rotation}${dataset}_M16_efConstruction500_operator0.index"
log_file="${ORIGINAL_DIR}/log_ood/hnsw_${dataset}_K${K}_operator${operator}_search_log_id_test.txt"
./hnsw_search -k ${K} -n ${dataset_path} -q ${query_path} -g ${ground_truth_path} -i ${index_path} -o ${operator} > ${log_file} 2>&1

if [ $? -ne 0 ]; then
    echo "${dataset} HNSW Search FAIL"
    exit 1
fi

####################################################

dataset="text2image"                                                   #**
K=100                                                             # 20, 100
rotation="P"
dataset_path="/home/zzlin/dataset/${dataset}/${rotation}text2image_base.fvecs"     #**
query_path="/home/zzlin/dataset/${dataset}/query.public.100K.fbin"           #**
ground_truth_path="/home/zzlin/dataset/${dataset}/gt_256.ivecs"
operator=4                                                       #**
index_path="/home/zzlin/dataset/${dataset}/hnsw_${rotation}${dataset}_M16_efConstruction500_operator0.index"
log_file="${ORIGINAL_DIR}/log_ood/hnsw_${dataset}_K${K}_operator${operator}_search_log_ood_test.txt"
./hnsw_search -k ${K} -n ${dataset_path} -q ${query_path} -g ${ground_truth_path} -i ${index_path} -o ${operator} > ${log_file} 2>&1

if [ $? -ne 0 ]; then
    echo "${dataset} HNSW Search FAIL"
    exit 1
fi

############################################
dataset="laion"                                                    #**
K=100                                                             # 20, 100
rotation="O"
dataset_path="/home/zzlin/dataset/${dataset}/${rotation}laion_base.fvecs"     #**
query_path="/home/zzlin/dataset/${dataset}/query_img.fvecs"           #**
ground_truth_path="/home/zzlin/dataset/${dataset}/gt_img_img_256.ivecs"
operator=3                                                       #**
index_path="/home/zzlin/dataset/${dataset}/hnsw_${rotation}${dataset}_M16_efConstruction500_operator0.index"
log_file="${ORIGINAL_DIR}/log_ood/hnsw_${dataset}_K${K}_operator${operator}_search_log_id_test.txt"
./hnsw_search -k ${K} -n ${dataset_path} -q ${query_path} -g ${ground_truth_path} -i ${index_path} -o ${operator} > ${log_file} 2>&1

if [ $? -ne 0 ]; then
    echo "${dataset} HNSW Search FAIL"
    exit 1
fi

####################################################

dataset="laion"                                                    #**
K=100                                                             # 20, 100
rotation="O"
dataset_path="/home/zzlin/dataset/${dataset}/${rotation}laion_base.fvecs"     #**
query_path="/home/zzlin/dataset/${dataset}/query_text.fvecs"           #**
ground_truth_path="/home/zzlin/dataset/${dataset}/gt_img_text_256.ivecs"
operator=3                                                       #**
index_path="/home/zzlin/dataset/${dataset}/hnsw_${rotation}${dataset}_M16_efConstruction500_operator0.index"
log_file="${ORIGINAL_DIR}/log_ood/hnsw_${dataset}_K${K}_operator${operator}_search_log_ood_test.txt"
./hnsw_search -k ${K} -n ${dataset_path} -q ${query_path} -g ${ground_truth_path} -i ${index_path} -o ${operator} > ${log_file} 2>&1

if [ $? -ne 0 ]; then
    echo "${dataset} HNSW Search FAIL"
    exit 1
fi

############################################
dataset="text2image"                                                    #**
K=100                                                             # 20, 100
rotation="O"
dataset_path="/home/zzlin/dataset/${dataset}/${rotation}text2image_base.fvecs"     #**
query_path="/home/zzlin/dataset/${dataset}/query_rand.fvecs"           #**
ground_truth_path="/home/zzlin/dataset/${dataset}/gt_256_rand.ivecs"
operator=3                                                       #**
index_path="/home/zzlin/dataset/${dataset}/hnsw_${rotation}${dataset}_M16_efConstruction500_operator0.index"
log_file="${ORIGINAL_DIR}/log_ood/hnsw_${dataset}_K${K}_operator${operator}_search_log_id_test.txt"
./hnsw_search -k ${K} -n ${dataset_path} -q ${query_path} -g ${ground_truth_path} -i ${index_path} -o ${operator} > ${log_file} 2>&1

if [ $? -ne 0 ]; then
    echo "${dataset} HNSW Search FAIL"
    exit 1
fi

####################################################

dataset="text2image"                                                   #**
K=100                                                             # 20, 100
rotation="O"
dataset_path="/home/zzlin/dataset/${dataset}/${rotation}text2image_base.fvecs"     #**
query_path="/home/zzlin/dataset/${dataset}/query.public.100K.fbin"           #**
ground_truth_path="/home/zzlin/dataset/${dataset}/gt_256.ivecs"
operator=3                                                       #**
index_path="/home/zzlin/dataset/${dataset}/hnsw_${rotation}${dataset}_M16_efConstruction500_operator0.index"
log_file="${ORIGINAL_DIR}/log_ood/hnsw_${dataset}_K${K}_operator${operator}_search_log_ood_test.txt"
./hnsw_search -k ${K} -n ${dataset_path} -q ${query_path} -g ${ground_truth_path} -i ${index_path} -o ${operator} > ${log_file} 2>&1

if [ $? -ne 0 ]; then
    echo "${dataset} HNSW Search FAIL"
    exit 1
fi

############################################
dataset="laion"                                                    #**
K=100                                                             # 20, 100
rotation="L"
dataset_path="/home/zzlin/dataset/${dataset}/${rotation}laion_base.fvecs"     #**
query_path="/home/zzlin/dataset/${dataset}/query_img.fvecs"           #**
ground_truth_path="/home/zzlin/dataset/${dataset}/gt_img_img_256.ivecs"
operator=5                                                       #**
index_path="/home/zzlin/dataset/${dataset}/hnsw_${rotation}${dataset}_M16_efConstruction500_operator0.index"
log_file="${ORIGINAL_DIR}/log_ood/hnsw_${dataset}_K${K}_operator${operator}_search_log_id_test.txt"
./hnsw_search -k ${K} -n ${dataset_path} -q ${query_path} -g ${ground_truth_path} -i ${index_path} -o ${operator} > ${log_file} 2>&1

if [ $? -ne 0 ]; then
    echo "${dataset} HNSW Search FAIL"
    exit 1
fi

####################################################

dataset="laion"                                                    #**
K=100                                                             # 20, 100
rotation="L"
dataset_path="/home/zzlin/dataset/${dataset}/${rotation}laion_base.fvecs"     #**
query_path="/home/zzlin/dataset/${dataset}/query_text.fvecs"           #**
ground_truth_path="/home/zzlin/dataset/${dataset}/gt_img_text_256.ivecs"
operator=5                                                       #**
index_path="/home/zzlin/dataset/${dataset}/hnsw_${rotation}${dataset}_M16_efConstruction500_operator0.index"
log_file="${ORIGINAL_DIR}/log_ood/hnsw_${dataset}_K${K}_operator${operator}_search_log_ood_test.txt"
./hnsw_search -k ${K} -n ${dataset_path} -q ${query_path} -g ${ground_truth_path} -i ${index_path} -o ${operator} > ${log_file} 2>&1

if [ $? -ne 0 ]; then
    echo "${dataset} HNSW Search FAIL"
    exit 1
fi

############################################
dataset="text2image"                                                    #**
K=100                                                             # 20, 100
rotation="L"
dataset_path="/home/zzlin/dataset/${dataset}/${rotation}text2image_base.fvecs"     #**
query_path="/home/zzlin/dataset/${dataset}/query_rand.fvecs"           #**
ground_truth_path="/home/zzlin/dataset/${dataset}/gt_256_rand.ivecs"
operator=5                                                       #**
index_path="/home/zzlin/dataset/${dataset}/hnsw_${rotation}${dataset}_M16_efConstruction500_operator0.index"
log_file="${ORIGINAL_DIR}/log_ood/hnsw_${dataset}_K${K}_operator${operator}_search_log_id_test.txt"
./hnsw_search -k ${K} -n ${dataset_path} -q ${query_path} -g ${ground_truth_path} -i ${index_path} -o ${operator} > ${log_file} 2>&1

if [ $? -ne 0 ]; then
    echo "${dataset} HNSW Search FAIL"
    exit 1
fi

####################################################

dataset="text2image"                                                   #**
K=100                                                             # 20, 100
rotation="L"
dataset_path="/home/zzlin/dataset/${dataset}/${rotation}text2image_base.fvecs"     #**
query_path="/home/zzlin/dataset/${dataset}/query.public.100K.fbin"           #**
ground_truth_path="/home/zzlin/dataset/${dataset}/gt_256.ivecs"
operator=5                                                       #**
index_path="/home/zzlin/dataset/${dataset}/hnsw_${rotation}${dataset}_M16_efConstruction500_operator0.index"
log_file="${ORIGINAL_DIR}/log_ood/hnsw_${dataset}_K${K}_operator${operator}_search_log_ood_test.txt"
./hnsw_search -k ${K} -n ${dataset_path} -q ${query_path} -g ${ground_truth_path} -i ${index_path} -o ${operator} > ${log_file} 2>&1

if [ $? -ne 0 ]; then
    echo "${dataset} HNSW Search FAIL"
    exit 1
fi

############################################
dataset="laion"                                                    #**
K=100                                                             # 20, 100
rotation="L"
dataset_path="/home/zzlin/dataset/${dataset}/${rotation}laion_base.fvecs"     #**
query_path="/home/zzlin/dataset/${dataset}/query_img.fvecs"           #**
ground_truth_path="/home/zzlin/dataset/${dataset}/gt_img_img_256.ivecs"
operator=6                                                       #**
index_path="/home/zzlin/dataset/${dataset}/hnsw_${rotation}${dataset}_M16_efConstruction500_operator0.index"
log_file="${ORIGINAL_DIR}/log_ood/hnsw_${dataset}_K${K}_operator${operator}_search_log_id_test.txt"
./hnsw_search -k ${K} -n ${dataset_path} -q ${query_path} -g ${ground_truth_path} -i ${index_path} -o ${operator} > ${log_file} 2>&1

if [ $? -ne 0 ]; then
    echo "${dataset} HNSW Search FAIL"
    exit 1
fi

####################################################

dataset="laion"                                                    #**
K=100                                                             # 20, 100
rotation="L"
dataset_path="/home/zzlin/dataset/${dataset}/${rotation}laion_base.fvecs"     #**
query_path="/home/zzlin/dataset/${dataset}/query_text.fvecs"           #**
ground_truth_path="/home/zzlin/dataset/${dataset}/gt_img_text_256.ivecs"
operator=6                                                       #**
index_path="/home/zzlin/dataset/${dataset}/hnsw_${rotation}${dataset}_M16_efConstruction500_operator0.index"
log_file="${ORIGINAL_DIR}/log_ood/hnsw_${dataset}_K${K}_operator${operator}_search_log_ood_test.txt"
./hnsw_search -k ${K} -n ${dataset_path} -q ${query_path} -g ${ground_truth_path} -i ${index_path} -o ${operator} > ${log_file} 2>&1

if [ $? -ne 0 ]; then
    echo "${dataset} HNSW Search FAIL"
    exit 1
fi

############################################
dataset="text2image"                                                    #**
K=100                                                             # 20, 100
rotation="L"
dataset_path="/home/zzlin/dataset/${dataset}/${rotation}text2image_base.fvecs"     #**
query_path="/home/zzlin/dataset/${dataset}/query_rand.fvecs"           #**
ground_truth_path="/home/zzlin/dataset/${dataset}/gt_256_rand.ivecs"
operator=6                                                       #**
index_path="/home/zzlin/dataset/${dataset}/hnsw_${rotation}${dataset}_M16_efConstruction500_operator0.index"
log_file="${ORIGINAL_DIR}/log_ood/hnsw_${dataset}_K${K}_operator${operator}_search_log_id_test.txt"
./hnsw_search -k ${K} -n ${dataset_path} -q ${query_path} -g ${ground_truth_path} -i ${index_path} -o ${operator} > ${log_file} 2>&1

if [ $? -ne 0 ]; then
    echo "${dataset} HNSW Search FAIL"
    exit 1
fi

####################################################

dataset="text2image"                                                   #**
K=100                                                             # 20, 100
rotation="L"
dataset_path="/home/zzlin/dataset/${dataset}/${rotation}text2image_base.fvecs"     #**
query_path="/home/zzlin/dataset/${dataset}/query.public.100K.fbin"           #**
ground_truth_path="/home/zzlin/dataset/${dataset}/gt_256.ivecs"
operator=6                                                       #**
index_path="/home/zzlin/dataset/${dataset}/hnsw_${rotation}${dataset}_M16_efConstruction500_operator0.index"
log_file="${ORIGINAL_DIR}/log_ood/hnsw_${dataset}_K${K}_operator${operator}_search_log_ood_test.txt"
./hnsw_search -k ${K} -n ${dataset_path} -q ${query_path} -g ${ground_truth_path} -i ${index_path} -o ${operator} > ${log_file} 2>&1

if [ $? -ne 0 ]; then
    echo "${dataset} HNSW Search FAIL"
    exit 1
fi

############################################
dataset="laion"                                                    #**
K=100                                                             # 20, 100
rotation="Q"
dataset_path="/home/zzlin/dataset/${dataset}/${rotation}laion_base.fvecs"     #**
query_path="/home/zzlin/dataset/${dataset}/query_img.fvecs"           #**
ground_truth_path="/home/zzlin/dataset/${dataset}/gt_img_img_256.ivecs"
operator=7                                                       #**
index_path="/home/zzlin/dataset/${dataset}/hnsw_${rotation}${dataset}_M16_efConstruction500_operator0.index"
log_file="${ORIGINAL_DIR}/log_ood/hnsw_${dataset}_K${K}_operator${operator}_search_log_id_test.txt"
./hnsw_search -k ${K} -n ${dataset_path} -q ${query_path} -g ${ground_truth_path} -i ${index_path} -o ${operator} > ${log_file} 2>&1

if [ $? -ne 0 ]; then
    echo "${dataset} HNSW Search FAIL"
    exit 1
fi

####################################################

dataset="laion"                                                    #**
K=100                                                             # 20, 100
rotation="Q"
dataset_path="/home/zzlin/dataset/${dataset}/${rotation}laion_base.fvecs"     #**
query_path="/home/zzlin/dataset/${dataset}/query_text.fvecs"           #**
ground_truth_path="/home/zzlin/dataset/${dataset}/gt_img_text_256.ivecs"
operator=7                                                       #**
index_path="/home/zzlin/dataset/${dataset}/hnsw_${rotation}${dataset}_M16_efConstruction500_operator0.index"
log_file="${ORIGINAL_DIR}/log_ood/hnsw_${dataset}_K${K}_operator${operator}_search_log_ood_test.txt"
./hnsw_search -k ${K} -n ${dataset_path} -q ${query_path} -g ${ground_truth_path} -i ${index_path} -o ${operator} > ${log_file} 2>&1

if [ $? -ne 0 ]; then
    echo "${dataset} HNSW Search FAIL"
    exit 1
fi

############################################
dataset="text2image"                                                    #**
K=100                                                             # 20, 100
rotation="Q"
dataset_path="/home/zzlin/dataset/${dataset}/${rotation}text2image_base.fvecs"     #**
query_path="/home/zzlin/dataset/${dataset}/query_rand.fvecs"           #**
ground_truth_path="/home/zzlin/dataset/${dataset}/gt_256_rand.ivecs"
operator=7                                                       #**
index_path="/home/zzlin/dataset/${dataset}/hnsw_${rotation}${dataset}_M16_efConstruction500_operator0.index"
log_file="${ORIGINAL_DIR}/log_ood/hnsw_${dataset}_K${K}_operator${operator}_search_log_id_test.txt"
./hnsw_search -k ${K} -n ${dataset_path} -q ${query_path} -g ${ground_truth_path} -i ${index_path} -o ${operator} > ${log_file} 2>&1

if [ $? -ne 0 ]; then
    echo "${dataset} HNSW Search FAIL"
    exit 1
fi

####################################################

dataset="text2image"                                                   #**
K=100                                                             # 20, 100
rotation="Q"
dataset_path="/home/zzlin/dataset/${dataset}/${rotation}text2image_base.fvecs"     #**
query_path="/home/zzlin/dataset/${dataset}/query.public.100K.fbin"           #**
ground_truth_path="/home/zzlin/dataset/${dataset}/gt_256.ivecs"
operator=7                                                       #**
index_path="/home/zzlin/dataset/${dataset}/hnsw_${rotation}${dataset}_M16_efConstruction500_operator0.index"
log_file="${ORIGINAL_DIR}/log_ood/hnsw_${dataset}_K${K}_operator${operator}_search_log_ood_test.txt"
./hnsw_search -k ${K} -n ${dataset_path} -q ${query_path} -g ${ground_truth_path} -i ${index_path} -o ${operator} > ${log_file} 2>&1

if [ $? -ne 0 ]; then
    echo "${dataset} HNSW Search FAIL"
    exit 1
fi

cd "$ORIGINAL_DIR"