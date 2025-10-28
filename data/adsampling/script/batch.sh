#!/bin/bash

ORIGINAL_DIR=$(pwd)
cd .. || exit 1

datasets=("deep1b" "glove100" "sift" "gist" "OpenAIArXiv" "trevi")
base=("base.1B.fbin.crop_nb_100000000" "glove100.bin" "sift_base.fvecs" "gist_base.fvecs" "openai_base.bin" "trevi_base.fvecs")

for data in {0..6}; do
  log_file="${ORIGINAL_DIR}/log/${datasets[$data]}_randomized.txt"

  python randomized.py -d "${datasets[$data]}" -n "${base[$data]}" > "${log_file}" 2>&1

  if [ $? -ne 0 ]; then
      echo "${datasets[$data]} Randomized FAIL"
      exit 1
  fi
done

cd "$ORIGINAL_DIR" ||  exit