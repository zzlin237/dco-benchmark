#!/bin/bash

# shellcheck disable=SC2054
datasets=("glove100" "sift" "gist" "OpenAIArXiv" "trevi")
query=("query.fvecs" "query.fvecs" "query.fvecs" "openai_query.bin" "query.fvecs")
rotate=("" "" "P" "O" "P" "L" "L" "Q")
KNN=(20 100)

ORIGINAL_DIR=$(pwd)
cd ../../build/src || exit

for data in {0..4}; do
  for op in {0..6}; do
    for K in ${KNN[*]}; do
      dataset_path="/home/dataset/${datasets[$data]}/${rotate[$op]}${datasets[$data]}_base.fvecs"
      query_path="/home/dataset/${datasets[$data]}/${query[$data]}"
      ground_truth_path="/home/dataset/${datasets[$data]}/gt_256.ivecs"
      index_path="/home/dataset/${datasets[$data]}/hnsw_${rotate[$op]}${datasets[$data]}_M16_efConstruction500_operator0.index"
      log_file="${ORIGINAL_DIR}/query_performance/hnsw_${datasets[$data]}_K${K}_operator${op}_search_log.txt"

      ./hnsw_search -k "${K}" -n "${dataset_path}" -q "${query_path}" -g "${ground_truth_path}" -i "${index_path}" -o "${op}" >"${log_file}" 2>&1

      if [ $? -ne 0 ]; then
          echo "${datasets[$data]} HNSW Search FAIL"
          exit 1
      fi
    done
  done
done

cd "$ORIGINAL_DIR" || exit