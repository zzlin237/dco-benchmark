//
// Created by 郑荘霖 on 2025/7/3.
//
//#define _STATISTICS_
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

//void save_pq_mp_binary(const std::string& filename, std::vector<uint8_t> &pq_mp_) {
//    std::ofstream out(filename, std::ios::binary);
//    size_t size = pq_mp_.size();
//    out.write(reinterpret_cast<const char*>(&size), sizeof(size));
//    out.write(reinterpret_cast<const char*>(pq_mp_.data()), size * sizeof(uint8_t));
//    out.close();
//}
//
//void load_pq_mp_binary(const std::string& filename, std::vector<uint8_t> &pq_mp_) {
//    std::ifstream in(filename, std::ios::binary);
//    size_t size;
//    in.read(reinterpret_cast<char*>(&size), sizeof(size));
//    pq_mp_.resize(size);
//    in.read(reinterpret_cast<char*>(pq_mp_.data()), size * sizeof(uint8_t));
//    in.close();
//}
//
//void save_node_cluster_dist_binary(const std::string& filename, std::vector<float> &node_cluster_dist_) {
//    std::ofstream out(filename, std::ios::binary);
//    size_t size = node_cluster_dist_.size();
//    out.write(reinterpret_cast<const char*>(&size), sizeof(size));
//    out.write(reinterpret_cast<const char*>(node_cluster_dist_.data()), size * sizeof(float));
//    out.close();
//}
//
//void load_node_cluster_dist_binary(const std::string& filename, std::vector<float> &node_cluster_dist_) {
//    std::ifstream in(filename, std::ios::binary);
//    size_t size;
//    in.read(reinterpret_cast<char*>(&size), sizeof(size));
//    node_cluster_dist_.resize(size);
//    in.read(reinterpret_cast<char*>(node_cluster_dist_.data()), size * sizeof(float));
//    in.close();
//}

int main(int argc, char *argv[]) {
    std::string dataset_path = "/home/zzlin/dataset/sift/dade/E/0.10.fvecs";
    std::string dataset_path2 = "/home/zzlin/dataset/sift/dade/E2/0.10.fvecs";

    std::vector<VectorDataType> data_list;
    ReadVectorData(dataset_path, data_list);
    std::vector<VectorDataType> data_list2;
    ReadVectorData(dataset_path2, data_list2);

    for (int i = 0; i < data_list[0].Dimension() - 1; ++i) {
        if (data_list[0][i] < data_list2[0][i + 1]) {
            std::cout << i << " " << data_list[0][i] << " " << data_list[0][i + 1] << std::endl;
        }
    }

    for (int i = 0; i < data_list[0].Dimension() - 1; ++i) {
        if (data_list2[0][i] < data_list[0][i + 1]) {
            std::cout << i << " " << data_list[0][i] << " " << data_list[0][i + 1] << std::endl;
        }
    }

    std::cout << std::endl;
//    std::string new_index_path = "/home/zzlin/dataset/wiki/hnsw_norm_Qwiki_M16_efConstruction500_operator8.index";
//    int dim = 768;
//    hnswlib::InnerProductSpace space(dim);
//    hnswlib::HierarchicalNSW<float> *alg_hnsw = new hnswlib::HierarchicalNSW<float>(&space, new_index_path);
//
//    std::unique_ptr<DDCopqIP2> ddcopq = std::make_unique<DDCopqIP2>(dataset_path, dim, false);
//    ddcopq->pq_mp_.resize(alg_hnsw->cur_element_count * ddcopq->sub_vector_);
//    ddcopq->node_cluster_dist_.resize(alg_hnsw->cur_element_count);
//    double ave_dist = 0.0;
//    for (int i = 0; i < alg_hnsw->cur_element_count; i++) {
//        float dist_to_centroid = 0.0;
//        for (int j = 0; j < ddcopq->sub_vector_; j++) {
//            uint8_t belong = 0;
//            float dist = ddcopq->distfunc_sub_((float *) alg_hnsw->getDataByInternalId(i) + j * ddcopq->sub_dim_,
//                                               ddcopq->pq_book_[j][0].data(),
//                                               ddcopq->dist_func_param_sub_);
//            for (int k = 1; k < ddcopq->sub_cluster_count_; k++) {
//                float new_dist = ddcopq->distfunc_sub_((float *) alg_hnsw->getDataByInternalId(i) + j * ddcopq->sub_dim_,
//                                                       ddcopq->pq_book_[j][k].data(),
//                                                       ddcopq->dist_func_param_sub_);
//                if (new_dist < dist) {
//                    belong = k;
//                    dist = new_dist;
//                }
//            }
//            dist_to_centroid += dist;
//            ddcopq->pq_mp_[i * ddcopq->sub_vector_ + j] = belong;
//        }
//        ddcopq->node_cluster_dist_[i] = dist_to_centroid;
//        ave_dist += dist_to_centroid;
//        if (i % 50000 == 0) std::cerr << "Encoder progress: " << i << " / " << alg_hnsw-> cur_element_count << std::endl;
//    }
//    std::cerr << "Encoder ave dist:: " << ave_dist / alg_hnsw-> cur_element_count << std::endl;
//    save_pq_mp_binary("/home/zzlin/dataset/wiki/norm_pq_mp.bin", ddcopq->pq_mp_);
//    save_node_cluster_dist_binary("/home/zzlin/dataset/wiki/norm_node_cluster_dist.bin", ddcopq->node_cluster_dist_);
    return 0;
}