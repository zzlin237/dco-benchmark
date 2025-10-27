//
// Created by 郑荘霖 on 2025/7/22.
//
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
#include "../../include/ivf/ivf.h"

using SearchKnnFuncPtr = std::priority_queue<std::pair<float, size_t>> (IVF::*)(float *, size_t, size_t, float) const;
SearchKnnFuncPtr knn_ptr = nullptr;

int main() {
    delta_d = 192;

    int K = 100;
    std::string dataset_path = "/home/zzlin/dataset/gist/Lgist_base.fvecs";
    std::string query_path = "/home/zzlin/dataset/gist/query.fvecs";
    std::string ground_truth_path = "/home/zzlin/dataset/gist/gt_256.ivecs";
    std::string index_path = "/home/zzlin/dataset/gist/ivf_Lgist_C4096_operator0.index";
    int op = 6;

    std::cout << "K: " << K << std::endl;
    std::cout << "dataset_path: " << dataset_path << std::endl;
    std::cout << "query_path: " << query_path << std::endl;
    std::cout << "ground_truth_path: " << ground_truth_path << std::endl;
    std::cout << "index_path: " << index_path << std::endl;
    std::cout << "operator: " << op << std::endl;

#ifdef _FIX_DIMENSION_
    std::cout << "init_d: " << init_d << std::endl;
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
    if (op >= 6) {
        msg = "ivf" + msg;
        if (delta_d != 32) {
            msg = "delta" + std::to_string(delta_d) + "_" + msg;
        }
    }

    //// load index
    int dim = query_list[0].Dimension();
    IVF ivf;
    ivf.load(index_path.c_str());
    ivf.dist_compare_operator_ = setup_DCO(dataset_path, dim, op, msg);
    knn_ptr = &IVF::searchKnn;

#ifdef _FIX_DIMENSION_
    ivf.rebuild();
#endif

    //// search
    std::vector<size_t> probes;
    for (int i = 1; i <= 20; ++i) {
        probes.push_back(i * 20);
    }
    if (op >= 2) {
        for (auto &query: query_list) {
            HPLogger hp_logger;
            ivf.dist_compare_operator_->query_transform(query.data.data());
            hp_logger.SetEndTimer();
            ivf.dist_compare_operator_->add_rota_time(hp_logger.GetDurationTime());
        }
    }

    if (op == 5) {
        knn_ptr = &IVF::searchKnnIP;
        logger.SetStartTimer();
        ivf.compute_base_square(false);
        logger.SetEndTimer();
        std::cout << "compute base square time: " << logger.GetDurationTime() << " [ms] " << std::endl;
    }

    if (op == 7) {
        knn_ptr = &IVF::searchKnnOPQSIMD;
        logger.SetStartTimer();
        ivf.encoder_origin_data();
        logger.SetEndTimer();
        std::cout << "encoder origin data time: " << logger.GetDurationTime() << " [ms] " << std::endl;
    }

//    ivf.dist_compare_operator_->cancel_SIMD();
//    std::cout << "without SIMD" << std::endl;
//    if (op == 7) {
//        knn_ptr = &IVF::searchKnnOPQ;
//    }
    HPLogger hp_logger;
    for (auto probe: probes) {
        double duration_time = 0;
        std::vector<std::vector<VidType>> answer_list;
        for (auto query: query_list) {
            hp_logger.SetStartTimer();
            std::vector<VidType> result;
            std::priority_queue<std::pair<float, size_t>> Result = (ivf.*knn_ptr)(query.data.data(), K, probe,
                                                                                  std::numeric_limits<float>::max());
            while (!Result.empty()) result.emplace_back(Result.top().second), Result.pop();
            std::reverse(result.begin(), result.end());
            answer_list.push_back(result);
            hp_logger.SetEndTimer();
            duration_time += hp_logger.GetDurationTime();
            std::cout << "query" << query.vid << ": " << "search time = " << std::fixed << std::setprecision(6)
                      << hp_logger.GetDurationTime() << " [ms] " << std::endl;
        }
        std::cout << "probe" << probe << ": " << "search time = " << std::fixed << std::setprecision(6) << duration_time
                  << " [ms] " << " ";
        EvaluateAnswer(answer_list, ground_truth, K);
    }
#ifdef _STATISTICS_
    ivf.dist_compare_operator_->print_statistics();
#endif
    return 0;
}