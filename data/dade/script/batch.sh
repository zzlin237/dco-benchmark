#!/bin/bash

ORIGINAL_DIR=$(pwd)
cd .. || exit 1

datasets=("deep1b" "glove100" "sift" "gist" "OpenAIArXiv" "trevi")
base=("base.1B.fbin.crop_nb_100000000" "glove100.bin" "sift_base.fvecs" "gist_base.fvecs" "openai_base.bin" "trevi_base.fvecs")
normalize="0" # L2: 0, IP: 1
for data in {0..6}; do
  log_file="${ORIGINAL_DIR}/log/${datasets[$data]}_pca_${normalize}.txt"

  python pca.py -d "${datasets[$data]}" -n "${base[$data]}" -l "${normalize}" >"${log_file}" 2>&1

  if [ $? -ne 0 ]; then
    echo "${datasets[$data]} Pca FAIL"
    exit 1
  fi

  log_file="${ORIGINAL_DIR}/log/${datasets[$data]}_getEpsilon_${normalize}.txt"

  python getEpsilon.py -d "${datasets[$data]}" -n "${base[$data]}" -l ${normalize} > "${log_file}" 2>&1

  if [ $? -ne 0 ]; then
      echo "${datasets[$data]} GetEpsilon FAIL"
      exit 1
  fi
done

cd "$ORIGINAL_DIR" || exit
