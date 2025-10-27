//
// Created by 郑荘霖 on 2025/7/3.
//

#include <iostream>
#include <getopt.h>
#include <fstream>
#include <ctime>
#include <cmath>
#include <queue>
#include "../../utils.h"
#include "../../Logger/Logger.h"
#include "../../FileIO/File_IO.h"

int main() {
    int K = 100;
    std::string dataset_path = "/home/zzlin/dataset/sift/Psift_base.fvecs";
    std::string query_path = "/home/zzlin/dataset/sift/query.fvecs";
    std::string ground_truth_path = "/home/zzlin/dataset/sift/gt_256.ivecs";
    std::string index_path = "/home/zzlin/dataset/sift/hnsw_Psift_M16_efConstruction500_operator0.index";
    int op = 2;

    std::cout << "K: " << K << std::endl;
    std::cout << "dataset_path: " << dataset_path << std::endl;
    std::cout << "query_path: " << query_path << std::endl;
    std::cout << "ground_truth_path: " << ground_truth_path << std::endl;
    std::cout << "index_path: " << index_path << std::endl;
    std::cout << "operator: " << op << std::endl;

    //// read query and groundtruth
    Logger logger;
    std::vector<VectorDataType> query_list;
    std::vector<size_t> query_k_list;
    ReadVectorQuery(query_path, query_list, query_k_list);

    std::vector<std::vector<VidType>> ground_truth;
    ReadGroundTruth(ground_truth_path, ground_truth);

    //// load index
    int dim = query_list[0].Dimension();
    hnswlib::L2Space space(dim);
    hnswlib::HierarchicalNSW<float> *alg_hnsw = new hnswlib::HierarchicalNSW<float>(&space, index_path);
    alg_hnsw->dist_compare_operator_ = setup_DCO(dataset_path, dim, op);

    //// search
    std::vector<size_t> efs;
    if (K != 100) efs.push_back(K);
    for (int i = 1; i <= 15; ++i) {
        efs.push_back(i * 100);
    }
    if (op >= 2) {
        for (auto &query: query_list) {
            HPLogger hp_logger;
            alg_hnsw->dist_compare_operator_->query_transform(query.data.data());
            hp_logger.SetEndTimer();
            alg_hnsw->dist_compare_operator_->add_rota_time(hp_logger.GetDurationTime());
        }
    }
    for (auto ef : efs) {
        alg_hnsw->setEf(ef);
        logger.SetStartTimer();
        std::vector<std::vector<VidType>> answer_list;
        for (auto query: query_list) {
            std::vector<VidType> result;
            std::priority_queue<std::pair<float, hnswlib::labeltype>> Result = alg_hnsw->searchKnn(query.data.data(), K);
            while (!Result.empty()) result.emplace_back(Result.top().second), Result.pop();
            std::reverse(result.begin(), result.end());
            answer_list.push_back(result);
        }
        logger.SetEndTimer();
        double duration_time = logger.GetDurationTime();
        std::cout << "ef" << ef << ": "<< "search time = " << std::fixed << std::setprecision(6) << duration_time << " [ms] "<< " ";
        EvaluateAnswer(answer_list, ground_truth, K);
    }
    delete alg_hnsw;
    return 0;
}