//
// Created by 郑荘霖 on 2025/7/15.
//
#include <iostream>
#include <getopt.h>
#include <fstream>
#include <ctime>
#include <cmath>
#include <queue>
#include "../../include/hnswlib/hnswlib.h"
#include "../../FileIO/File_IO.h"
#include "../../utils.h"

int main() {
    //// parse arguments
    std::string dataset_path = "/home/zzlin/dataset/OpenAIArXiv/LOpenAIArXiv_base.fvecs";
    std::string query_path = "/home/zzlin/dataset/OpenAIArXiv/openai_query.bin";
    std::string index_path = "/home/zzlin/dataset/OpenAIArXiv/hnsw_OpenAIArXiv_M16_efConstruction500_operator8.index";
    std::string index_new_path = "/home/zzlin/dataset/OpenAIArXiv/hnsw_LOpenAIArXiv_M16_efConstruction500_operator8.index";
    int op = 13;

    std::cout << "dataset_path: " << dataset_path << std::endl;
    std::cout << "query_path: " << query_path << std::endl;
    std::cout << "index_path: " << index_path << std::endl;
    std::cout << "index_new_path: " << index_new_path << std::endl;
    std::cout << "operator: " << op << std::endl;

    //// read query and groundtruth
    std::vector<VectorDataType> data_list;
    ReadVectorData(dataset_path, data_list);
    std::vector<VectorDataType> query_list;
    std::vector<size_t> query_k_list;
    ReadVectorQuery(query_path, query_list, query_k_list);

    //// load index
    int dim = query_list[0].Dimension();
    hnswlib::L2Space space(dim);
    hnswlib::HierarchicalNSW<float> *alg_hnsw = new hnswlib::HierarchicalNSW<float>(&space, index_path);
    alg_hnsw->dist_compare_operator_ = setup_DCO(dataset_path, dim, op, "");
    int max_elements = alg_hnsw->max_elements_;
    for (int i = 0; i < max_elements; ++i) {
        char * dataPoint = alg_hnsw->getDataByInternalId(i);
        float * dataPoint_float = (float *) dataPoint;
        for (int j = 0; j < dim; ++j) {
            dataPoint_float[j] = data_list[i].data[j];
        }
        if (i % 50000 == 0) std::cout << "progress: " << i << " / " << max_elements << std::endl;
    }

    //// save index
    alg_hnsw->saveIndex(index_new_path);
    delete alg_hnsw;
    return 0;
}
