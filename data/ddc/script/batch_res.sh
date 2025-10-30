#!/bin/bash

ORIGINAL_DIR=$(pwd)

datasets=("glove100" "sift" "gist" "OpenAIArXiv" "trevi")
base=("glove100.bin" "sift_base.fvecs" "gist_base.fvecs" "openai_base.bin" "trevi_base.fvecs")

cd ../../build/src || exit

for data in {0..6}; do
  dataset_path="/home/dataset/${datasets[$data]}/${base[$data]}"
  learning_path="/home/dataset/${datasets[$data]}/${datasets[$data]}_train.fvecs"
  sampling=10000
  log_file="${ORIGINAL_DIR}/log/${datasets[$data]}_sampling.txt"

  ./hnsw_sample -n "${dataset_path}" -l "${learning_path}" -s "${sampling}" > ${log_file} 2>&1

  if [ $? -ne 0 ]; then
      echo "${datasets[$data]} Sample FAIL"
      exit 1
  fi

done

K=100
for data in {0..6}; do
  dataset_path="/home/dataset/${datasets[$data]}/${base[$data]}"
  learning_path="/home/dataset/${datasets[$data]}/${datasets[$data]}_train.fvecs"
  ground_truth_path="/home/zzlin/dataset/${datasets[$data]}/${datasets[$data]}_train_ground_truth.ivecs"
  log_file="${ORIGINAL_DIR}/log/${datasets[$data]}_train_groundtruth.txt"

  ./hnsw_bruteforce -k "${K}" -n "${dataset_path}" -l "${learning_path}" -g "${ground_truth_path}" > "${log_file}" 2>&1

  if [ $? -ne 0 ]; then
      echo "${datasets[$data]} Tarin Set GroundTruth FAIL"
      exit 1
  fi

done

cd .. || exit 1
for data in {0..6}; do
  learn_ground_truth="/home/zzlin/dataset/${datasets[$data]}/${datasets[$data]}_train_ground_truth.ivecs"
  log_file="${ORIGINAL_DIR}/log/${datasets[$data]}_ddc_pca_generate.txt"

  python pca.py -d "${datasets[$data]}" -n "${base[$data]}" -l "${learn_ground_truth}"> ${log_file} 2>&1

  if [ $? -ne 0 ]; then
      echo "${datasets[$data]} PCA FAIL"
      exit 1
  fi

done

cd "$ORIGINAL_DIR" || exit
