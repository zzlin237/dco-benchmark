//
// Created by 郑荘霖 on 2025/7/23.
//

#include <iostream>
#include <getopt.h>
#include <fstream>
#include <ctime>
#include <cmath>
#include <queue>
#include "../../include/hnswlib/hnswlib.h"
#include "../../FileIO/File_IO.h"
#include "../../include/ivf/ivf.h"
#include "../../utils.h"

int main() {
    //// parse arguments
    std::string dataset_path = "/home/zzlin/dataset/YouTube/PYouTube_base.fvecs";
    std::string query_path = "/home/zzlin/dataset/YouTube/YouTube.bin";
    std::string index_path = "/home/zzlin/dataset/YouTube/ivf_YouTube_C4096_operator0.index";
    std::string index_new_path = "/home/zzlin/dataset/YouTube/ivf_PYouTube_C4096_operator0.index";
    int op = 4;

    std::cout << "dataset_path: " << dataset_path << std::endl;
    std::cout << "query_path: " << query_path << std::endl;
    std::cout << "index_path: " << index_path << std::endl;
    std::cout << "index_new_path: " << index_new_path << std::endl;
    std::cout << "operator: " << op << std::endl;

    //// read query and groundtruth
    std::vector<VectorDataType> query_list;
    std::vector<size_t> query_k_list;
    ReadVectorQuery(query_path, query_list, query_k_list);

    //// load index
    int dim = query_list[0].Dimension();
    IVF ivf;
    ivf.load(index_path.c_str());
    ivf.dist_compare_operator_ = setup_DCO(dataset_path, dim, op, "");

    ivf.rotate_data();
    ivf.save(index_new_path);
    return 0;
}
