//
// Created by 郑荘霖 on 2025/7/29.
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

float normalize(float *vec, int dim) {
    float square_sum = 0.0f;
    for (int i = 0; i < dim; i++) {
        square_sum += vec[i] * vec[i];
    }
    float norm = sqrtf(square_sum);
    if (norm > 1e-30f) {
        for (int i = 0; i < dim; i++) {
            vec[i] = vec[i] / norm;
        }
    }
    return norm;
}

int main(int argc, char *argv[]) {
    //// parse arguments
    std::string dataset_path = "/home/zzlin/dataset/wiki/wiki_base.fvecs";
    std::string query_path = "/home/zzlin/dataset/wiki/wikipedia_query.bin";
    std::string index_path = "/home/zzlin/dataset/wiki/hnsw_wiki_M16_efConstruction500_operator0.index";
    std::string index_new_path = "/home/zzlin/dataset/wiki/hnsw_norm_wiki_M16_efConstruction500_operator0.index";
    int op = 0;

    std::cout << "dataset_path: " << dataset_path << std::endl;
    std::cout << "query_path: " << query_path << std::endl;
    std::cout << "index_path: " << index_path << std::endl;
    std::cout << "index_new_path: " << index_new_path << std::endl;
    std::cout << "operator: " << op << std::endl;

    std::string prefix = "";
    if (op == 2 || op == 4) {
        prefix = "P";
    } else if (op == 3) {
        prefix = "O";
    } else if (op == 5 || op == 6) {
        prefix = "L";
    }

    size_t last_slash_pos = dataset_path.find_last_of('/');
    std::string directory;
    if (last_slash_pos != std::string::npos) {
        directory = dataset_path.substr(0, last_slash_pos);
    } else {
        std::cerr << "Error: Invalid file path." << std::endl;
        std::exit(EXIT_FAILURE);
    }
    std::string DSSR_path = directory + "/" + prefix + "DSSR.fvecs";

    //// read query and groundtruth
    std::vector<VectorDataType> query_list;
    std::vector<size_t> query_k_list;
    ReadVectorQuery(query_path, query_list, query_k_list);

    //// load index
    std::vector<float> base_square_root;

    int dim = query_list[0].Dimension();
    hnswlib::L2Space space(dim);
    hnswlib::HierarchicalNSW<float> *alg_hnsw = new hnswlib::HierarchicalNSW<float>(&space, index_path);
    alg_hnsw->dist_compare_operator_ = setup_DCO(dataset_path, dim, op, "");
    int max_elements = alg_hnsw->max_elements_;
    for (int i = 0; i < max_elements; ++i) {
        char *dataPoint = alg_hnsw->getDataByInternalId(i);
        float norm = normalize((float *) dataPoint, dim);
        base_square_root.push_back(norm);
    }
    //// save index
    VectorDataType base_norm(base_square_root.size(), 0, base_square_root);
    std::vector<VectorDataType> base_norm_list;
    base_norm_list.push_back(base_norm);
    DumpVectorData(DSSR_path, base_norm_list);

    alg_hnsw->saveIndex(index_new_path);
    delete alg_hnsw;
    return 0;
}
