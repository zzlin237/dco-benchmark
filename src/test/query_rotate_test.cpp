//
// Created by 郑荘霖 on 2025/7/3.
//
#define _STATISTICS_
//#define _FIX_DIMENSION_

#include <iostream>
#include <getopt.h>
#include <fstream>
#include <ctime>
#include <set>
#include <cmath>
#include <queue>
#include "../../utils.h"
#include "../../Logger/Logger.h"
#include "../../FileIO/File_IO.h"

using SearchKnnFuncPtr =
std::priority_queue<std::pair<float, hnswlib::labeltype>>
(hnswlib::HierarchicalNSW<float>::*)(const void *, size_t, hnswlib::BaseFilterFunctor *) const;

SearchKnnFuncPtr knn_ptr = nullptr;


int main(int argc, char *argv[]) {
    printf("%zu\n", delta_d);
    int K = 100;
    std::string dataset_path = "/home/zzlin/dataset/gist/Pgist_base.fvecs";
    std::string query_path = "/home/zzlin/dataset/gist/query.fvecs";
    std::string ground_truth_path = "/home/zzlin/dataset/gist/gt_256.ivecs";
    std::string index_path = "/home/zzlin/dataset/gist/hnsw_Pgist_M16_efConstruction500_operator0.index";
    int op = 2;
    int mode = 1;

    std::cout << "mode: " << mode << std::endl;

    std::cout << "K: " << K << std::endl;
    std::cout << "dataset_path: " << dataset_path << std::endl;
    std::cout << "query_path: " << query_path << std::endl;
    std::cout << "ground_truth_path: " << ground_truth_path << std::endl;
    std::cout << "index_path: " << index_path << std::endl;
    std::cout << "operator: " << op << std::endl;

#ifdef _FIX_DIMENSION_
    if (init_d == 0) {
        std::cout << "Error: dimension not init" << std::endl;
        exit(1);
    }
    if (op == 0 || op == 7) {
        std::cout << "Error: operator not support" << std::endl;
        exit(1);
    }
#endif

    //// read query and groundtruth
    Logger logger;
    std::vector<VectorDataType> query_list;
    std::vector<size_t> query_k_list;
    ReadVectorQuery(query_path, query_list, query_k_list);

    std::vector<std::vector<VidType>> ground_truth;
    ReadGroundTruth(ground_truth_path, ground_truth);

    std::string msg = std::to_string(K);
    if (op == 6 || op == 7 || op == 14 || op == 15) {
        msg = "hnsw" + msg;
        if (delta_d != 32) {
            msg = "delta" + std::to_string(delta_d) + "_" + msg;
        }
    }

    //// load index
    int dim = query_list[0].Dimension();
    hnswlib::L2Space space(dim);
    hnswlib::HierarchicalNSW<float> *alg_hnsw = new hnswlib::HierarchicalNSW<float>(&space, index_path);
    alg_hnsw->dist_compare_operator_ = setup_DCO(dataset_path, dim, op, msg);
    knn_ptr = &hnswlib::HierarchicalNSW<float>::searchKnn;

    //// search
    std::vector<size_t> efs;
    efs.push_back(100);
    efs.push_back(K);
    for (int i = 1; i <= 15; ++i) {
        efs.push_back(i * 100);
    }
    if (op >= 2) {
        if (mode == 0) {
            for (auto &query: query_list) {
                HPLogger hp_logger;
                alg_hnsw->dist_compare_operator_->query_transform(query.data.data());
                hp_logger.SetEndTimer();
                alg_hnsw->dist_compare_operator_->add_rota_time(hp_logger.GetDurationTime());
            }
        } else {
            float *q = new float[dim * query_list.size()];
            for (int i = 0; i < query_list.size(); ++i) {
                std::memcpy(q + i * dim, query_list[i].data.data(), dim * sizeof(float));
            }
            HPLogger hp_logger;
            alg_hnsw->dist_compare_operator_->query_transform(q, query_list.size());
            hp_logger.SetEndTimer();
            alg_hnsw->dist_compare_operator_->add_rota_time(hp_logger.GetDurationTime());
        }

    }


#ifdef _STATISTICS_
    alg_hnsw->dist_compare_operator_->print_statistics();
#endif
    delete alg_hnsw;
    return 0;
}