import re
import os
import pandas as pd  # 导入pandas库


def truncate(n):
    """保留两位小数且去尾"""
    return int(n * 100) / 100


def extract_numbers_from_file(file_path):
    # 正则表达式匹配目标格式
    pattern = r'ef(\d+): search time = (\d+\.\d+) \[ms\]  recall = (\d+\.\d+) per query'

    No_ = []
    QPS_ = []
    recalls_ = []

    all_time = 0

    with open(file_path, 'r') as file:
        for line in file:
            match = re.search(pattern, line)
            if match:
                # 提取三个数字并转换为适当的类型（整数和浮点数）
                ef = int(match.group(1))
                search_time = float(match.group(2))
                all_time += search_time
                recall = float(match.group(3))

                No_.append(ef)
                QPS_.append(truncate(1000 / search_time * 100))  # 去尾保留两位小数
                recalls_.append(str(truncate(recall * 100)) + "%")  # 去尾保留两位小数

    print("all_time:", all_time)
    return No_, QPS_, recalls_


def print_list(lst):
    for l in lst:
        print(l, end='\t')
    print()


def list_all_files(directory):
    all_data = []  # 创建一个列表来存储所有文件的数据

    for root, dirs, files in os.walk(directory):
        for file in files:
            file_path = os.path.join(root, file)
            print(file_path)
            No, QPS, recalls = extract_numbers_from_file(file_path)
            print_list(No)
            print_list(QPS)
            print_list(recalls)
            print("-------------------------------------")


# 示例调用
directory = 'D://C++ plus//DCOs//src//script//log_ood'  # 文件路径
list_all_files(directory)
