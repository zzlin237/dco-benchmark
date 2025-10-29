#!/bin/bash

ORIGINAL_DIR=$(pwd)
cd ../../build/Construction || exit 1

datasets=("deep1b" "glove100" "sift" "gist" "OpenAIArXiv" "trevi" "text2image" "laion")
base=("base.1B.fbin.crop_nb_100000000" "glove100.bin" "sift_base.fvecs" "gist_base.fvecs" "openai_base.bin" "trevi_base.fvecs" "base.1B.fbin.crop_nb_10000000" "img_dataset.bin")
rotation=""
#rotate=("" "" "P" "O" "P" "L" "L" "Q") FDScanning, PDScanning, PDScanning+, ADSampling, DADE, DDCres, DDCpca, DDCopq

M=16
efConstruction=500
operator=0 # L2: 0, IP: 8
# L2: FDScanning 0, PDScanning 1, PDScanning+ 2, ADSampling 3, DADE 4, DDCres 5, DDCpca 6, DDCopq 7

for data in {0..6}; do
  dataset_path="/home/dataset/${datasets[$data]}/${rotation}${base[$data]}"
  index_path="/home/dataset/${datasets[$data]}/hnsw_${rotation}${datasets[$data]}_M${M}_efConstruction${efConstruction}_operator${operator}.index"
  log_file="${ORIGINAL_DIR}/log/hnsw_${rotation}${datasets[$data]}_M${M}_efConstruction${efConstruction}_operator${operator}_log.txt"

  ./hnsw_index -m "${M}" -e "${efConstruction}" -o "${operator}" -n "${dataset_path}" -i "${index_path}" > "${log_file}" 2>&1

  if [ $? -ne 0 ]; then
      echo "${datasets[$data]} Build HNSW Index FAIL"
      exit 1
  fi
done

cd "$ORIGINAL_DIR" || exit 1
