#Distance Comparison Operations Are Not Silver Bullets in Vector Similarity Search: A Benchmark Study on Their Merits and Limits

## Environment

OS: Ubuntu 24.04.2 LTS

GCC/G++: >= 13.3.0

CMake: >= 3.28.3

Python: >= 3.10.16

Eigen: >= 3.4.0

## Compile and run our algorithms

Execute the following commands to compile relevant code.

```sh
mkdir build
cd build
cmake ..
make
```

## Dataset

1. Download and preprocess the datasets. For details, please see `./data/README.md`
2. Index the datasets. 

```sh
./Construction/script/hnsw_batch.sh
./Construction/script/ivf_batch.sh
```

## DCO 

* Preprocess the datasets to obtain DCO operator. For details, please see `./data/README.md`

## Test

1. Test the queries of the datasets. 

```sh
./src/batch/hnsw_search.sh
./src/batch/ivf_seach.sh
./src/batch/hnsw_search_no_simd.sh
./src/batch/ivf_seach_no_simd.sh
```



