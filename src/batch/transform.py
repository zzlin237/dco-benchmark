import re
import os
import pandas as pd  # 导入pandas库

table = {
    0: "FDScanning",
    1: "PDScanning",
    2: "PDScanning+",
    3: "ADSampling",
    4: "DADE",
    5: "DDCres",
    6: "DDCpca",
    7: "DDCopq",
    8: "FDScanning",
    9: "PDScanning",
    10: "PDScanning+",
    11: "ADSampling",
    12: "DADE",
    13: "DDCres",
    16: "DDCpca",
    17: "DDCopq",
}


def truncate(n):
    """保留两位小数且去尾"""
    return int(n * 100) / 100


def extract_numbers_from_file(file_path):
    # 正则表达式匹配目标格式
    pattern = r'probe(\d+): search time = (\d+\.\d+) \[ms\]  recall = (\d+\.\d+) per query'

    No_ = []
    QPS_ = []
    recalls_ = []

    with open(file_path, 'r') as file:
        for line in file:
            match = re.search(pattern, line)
            if match:
                # 提取三个数字并转换为适当的类型（整数和浮点数）
                ef = int(match.group(1))
                search_time = float(match.group(2))
                recall = float(match.group(3))

                No_.append(ef)
                QPS_.append(truncate(1000 / search_time * 100))
                recalls_.append(str(truncate(recall * 100)))

    return No_, QPS_, recalls_


def print_list(lst, operator_number, QPS=True):
    if QPS:
        print("QPS[" + "\"" + table[operator_number] + "\"" + "]=[", end='')
    else:
        print("recall[" + "\"" + table[operator_number] + "\"" + "]=[", end='')
    for l in lst:
        print(l, end=', ')
    print("]")


def list_all_files(directory):
    all_data = []

    for root, dirs, files in os.walk(directory):
        for file in files:
            match = re.search(r'operator(\d+)', file)
            operator_number = int(match.group(1))
            match2 = re.search(r'K(\d+)', file)
            K = int(match2.group(1))
            file_path = os.path.join(root, file)
            print("#", end=" ")
            print(file_path)
            No, QPS, recalls = extract_numbers_from_file(file_path)
            # if K == 100:
            #     QPS = QPS[2:]
            #     recalls = recalls[2:]
            # else:
            #     QPS = QPS[1:]
            #     recalls = recalls[1:]
            print_list(QPS, operator_number, True)
            print_list(recalls, operator_number, False)


# 示例调用
directory = 'D://C++ plus//DCOs//src//script//tmp'  # 文件路径
list_all_files(directory)
