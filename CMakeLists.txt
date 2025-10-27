cmake_minimum_required(VERSION 3.21)
project(DCOs)

set(CMAKE_CXX_STANDARD 17)

find_package(Eigen3 REQUIRED)
include_directories(${EIGEN3_INCLUDE_DIR})

add_library(FileIO
        FileIO/File_IO.h
        FileIO/File_IO.cpp
        )

add_library(Logger
        Logger/Logger.h
        Logger/Logger.cpp
        )

add_library(hnswlib
        Logger
        include/hnswlib/bruteforce.h
        include/hnswlib/hnswlib.h
        include/hnswlib/hnswalg.h
        include/hnswlib/space_ip.h
        include/hnswlib/space_l2.h
        include/hnswlib/stop_condition.h
        include/hnswlib/visited_list_pool.h
        DCO/DCO.hpp
        DCO/L2/FScanning.hpp
        DCO/L2/PScanning.hpp
        DCO/L2/ADSampling.hpp
        DCO/L2/DADE.hpp
        DCO/L2/RPScanning.hpp
        DCO/L2/DDCres.hpp
        DCO/L2/DDCpca.hpp
        DCO/L2/DDCopq.hpp
        DCO/IP/FScanningIP.hpp
        DCO/IP/PScanningIP.hpp
        DCO/IP/RPScanningIP.hpp
        DCO/IP/ADSamplingIP.hpp
        DCO/IP/DADEIP.hpp
        DCO/IP/DDCresIP.hpp
        DCO/IP/DDCpcaIP.hpp
        DCO/IP/DDCopqIP.hpp
        DCO/IP/DDCpcaIP2.hpp
        DCO/IP/DDCopqIP2.hpp
        global.h
        utils.h
        )
set_target_properties(hnswlib PROPERTIES LINKER_LANGUAGE CXX)

add_library(hnswlibO
        hnswlib/hnswlib/bruteforce.h
        hnswlib/hnswlib/hnswlib.h
        hnswlib/hnswlib/hnswalg.h
        hnswlib/hnswlib/space_ip.h
        hnswlib/hnswlib/space_l2.h
        hnswlib/hnswlib/stop_condition.h
        hnswlib/hnswlib/visited_list_pool.h
        )
set_target_properties(hnswlibO PROPERTIES LINKER_LANGUAGE CXX)

add_library(ivf
        hnswlib
        include/ivf/ivf.h
        )
set_target_properties(ivf PROPERTIES LINKER_LANGUAGE CXX)

add_executable(DCOs main.cpp)

add_subdirectory(GroundTruth)

add_subdirectory(Construction)

add_subdirectory(src)

add_subdirectory(data/ddc)

#add_subdirectory(GPU)