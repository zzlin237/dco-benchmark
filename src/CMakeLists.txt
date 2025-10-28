cmake_minimum_required(VERSION 3.21)
project(src)

set(CMAKE_CXX_STANDARD 17)

add_executable(hnsw_search hnsw_search.cpp)
target_link_libraries(hnsw_search FileIO Logger hnswlib)
set_target_properties(hnsw_search PROPERTIES COMPILE_FLAGS "-O3")

add_executable(hnsw_search_no_simd hnsw_search_no_simd.cpp)
target_link_libraries(hnsw_search_no_simd FileIO Logger hnswlib)
set_target_properties(hnsw_search_no_simd PROPERTIES COMPILE_FLAGS "-O3")

add_executable(hnsw_search_test test/hnsw_search_test.cpp)
target_link_libraries(hnsw_search_test FileIO Logger hnswlib)
#set_target_properties(hnsw_search_test PROPERTIES COMPILE_FLAGS "-O3")

add_executable(hnsw_search_example test/hnsw_search_example.cpp)
target_link_libraries(hnsw_search_example FileIO Logger hnswlib)

add_executable(distribute_analysis_test test/distribute_analysis_test.cpp)
target_link_libraries(distribute_analysis_test FileIO Logger hnswlib)
set_target_properties(distribute_analysis_test PROPERTIES COMPILE_FLAGS "-O3")

add_executable(query_rotate_test test/query_rotate_test.cpp)
target_link_libraries(query_rotate_test FileIO Logger hnswlib)
set_target_properties(query_rotate_test PROPERTIES COMPILE_FLAGS "-O3")

add_executable(hnsw_rotation hnsw_rotation.cpp)
target_link_libraries(hnsw_rotation FileIO Logger hnswlib)
set_target_properties(hnsw_rotation PROPERTIES COMPILE_FLAGS "-O3")

add_executable(hnsw_rotation_test test/hnsw_rotation_test.cpp)
target_link_libraries(hnsw_rotation_test FileIO Logger hnswlib)
set_target_properties(hnsw_rotation_test PROPERTIES COMPILE_FLAGS "-O3")

add_executable(hnsw_sample hnsw_sample.cpp)
target_link_libraries(hnsw_sample FileIO Logger hnswlib)
set_target_properties(hnsw_sample PROPERTIES COMPILE_FLAGS "-O3")

add_executable(rotation_without_SIMD rotation_without_SIMD.cpp)
target_link_libraries(rotation_without_SIMD FileIO Logger hnswlib)
set_target_properties(rotation_without_SIMD PROPERTIES COMPILE_FLAGS "-O3")

add_executable(hnsw_bruteforce hnsw_bruteforce.cpp)
target_link_libraries(hnsw_bruteforce FileIO Logger hnswlib)
set_target_properties(hnsw_bruteforce PROPERTIES COMPILE_FLAGS "-O3")

add_executable(ivf_rotation ivf_rotation.cpp)
target_link_libraries(ivf_rotation FileIO Logger hnswlib)
set_target_properties(ivf_rotation PROPERTIES COMPILE_FLAGS "-O3")

add_executable(hnsw_robustness hnsw_robustness.cpp)
target_link_libraries(hnsw_robustness FileIO Logger hnswlib)
set_target_properties(hnsw_robustness PROPERTIES COMPILE_FLAGS "-O3")

add_executable(ivf_search ivf_search.cpp)
target_link_libraries(ivf_search FileIO Logger hnswlib ivf)
set_target_properties(ivf_search PROPERTIES COMPILE_FLAGS "-O3")

add_executable(ivf_search_no_simd ivf_search_no_simd.cpp)
target_link_libraries(ivf_search_no_simd FileIO Logger hnswlib ivf)
set_target_properties(ivf_search_no_simd PROPERTIES COMPILE_FLAGS "-O3")


add_executable(hnsw_update hnsw_update.cpp)
target_link_libraries(hnsw_update FileIO Logger hnswlib)
set_target_properties(hnsw_update PROPERTIES COMPILE_FLAGS "-O3")

add_executable(hnsw_update_opq hnsw_update_opq.cpp)
target_link_libraries(hnsw_update_opq FileIO Logger hnswlib)
set_target_properties(hnsw_update_opq PROPERTIES COMPILE_FLAGS "-O3")

add_executable(hnsw_update_ip hnsw_update_ip.cpp)
target_link_libraries(hnsw_update_ip FileIO Logger hnswlib)
set_target_properties(hnsw_update_ip PROPERTIES COMPILE_FLAGS "-O3")

add_executable(hnsw_normalize hnsw_normalize.cpp)
target_link_libraries(hnsw_normalize FileIO Logger hnswlib)
set_target_properties(hnsw_normalize PROPERTIES COMPILE_FLAGS "-O3")

add_executable(hnsw_normalize_test test/hnsw_normalize_test.cpp)
target_link_libraries(hnsw_normalize_test FileIO Logger hnswlib)

add_executable(hnsw_update_test test/hnsw_update_test.cpp)
target_link_libraries(hnsw_update_test FileIO Logger hnswlib)
set_target_properties(hnsw_update_test PROPERTIES COMPILE_FLAGS "-O3")

add_executable(ivf_search_test test/ivf_search_test.cpp)
target_link_libraries(ivf_search_test FileIO Logger hnswlib ivf)
#set_target_properties(ivf_search_test PROPERTIES COMPILE_FLAGS "-O3")

add_executable(ivf_rotation_test test/ivf_rotation_test.cpp)
target_link_libraries(ivf_rotation_test FileIO Logger hnswlib ivf)
#set_target_properties(ivf_rotation_test PROPERTIES COMPILE_FLAGS "-O3")


add_executable(test test/test.cpp)
target_link_libraries(test FileIO Logger hnswlib)
set_target_properties(test PROPERTIES COMPILE_FLAGS "-O3")