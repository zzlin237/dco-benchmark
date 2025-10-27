#!/bin/bash

ORIGINAL_DIR=$(pwd)
cd ..

dataset="YouTube"            # **
name="YouTube.bin"    # **

log_file="${ORIGINAL_DIR}/log/${dataset}_randomized.txt"

python randomized.py -d ${dataset} -n ${name} > ${log_file} 2>&1

if [ $? -ne 0 ]; then
    echo "${dataset} Randomized FAIL"
    exit 1
fi

cd "$ORIGINAL_DIR"