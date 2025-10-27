#!/bin/bash

# shellcheck disable=SC2054
init=0
delta=(8 16 32 64 96 128 160)
rotate=("" "" "P" "O" "P" "L" "L" "Q")
K=100

ORIGINAL_DIR=$(pwd)
cd ../../build/src || exit

for op in {0..6}; do
  for d in "${delta[@]}"; do
    dataset_path="/home/zzlin/dataset/gist/${rotate[$op]}gist_base.fvecs"
    query_path="/home/zzlin/dataset/gist/query.fvecs"
    ground_truth_path="/home/zzlin/dataset/gist/gt_256.ivecs"
    index_path="/home/zzlin/dataset/gist/hnsw_${rotate[$op]}gist_M16_efConstruction500_operator0.index"
    log_file="${ORIGINAL_DIR}/delta/hnsw_gist_K${K}_operator${op}_search_init${init}_delta${d}_log.txt"

    ./hnsw_search -k "${K}" -n "${dataset_path}" -q "${query_path}" -g "${ground_truth_path}" -i "${index_path}" -o "${op}" -t "${init}" -d "${d}" >"${log_file}" 2>&1

    if [ $? -ne 0 ]; then
      echo "gist HNSW Search FAIL"
      exit 1
    fi
  done
done

cd "$ORIGINAL_DIR" || exit
