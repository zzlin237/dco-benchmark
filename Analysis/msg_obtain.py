import os
import re
import pandas as pd

def extract_tot_dimension_from_file(file_path):
    """
    从单个文件中提取所有tot_dimension值
    """
    tot_dimensions = []
    with open(file_path, 'r', encoding='utf-8') as file:
        content = file.read()
        # 使用正则表达式查找所有tot_dimension值
        pattern = r'tot_dimension:\s*(\d+\.?\d*)'
        matches = re.findall(pattern, content)
        # 将匹配的字符串转换为浮点数
        tot_dimensions = [float(match) for match in matches]
    return tot_dimensions

def process_sta_files(directory_path):
    """
    处理指定目录下所有以_sta结尾的.txt文件
    """
    all_data = {}

    # 遍历目录中的所有文件
    for filename in os.listdir(directory_path):
        # 检查是否是以_sta结尾的.txt文件
        if filename.endswith('_sta.txt'):
            file_path = os.path.join(directory_path, filename)
            print(f"Processing file: {filename}")

            # 提取tot_dimension值
            tot_dimensions = extract_tot_dimension_from_file(file_path)

            # 将文件名作为键，tot_dimension数组作为值
            all_data[filename] = tot_dimensions

    return all_data

def save_to_excel(data, output_file):
    with pd.ExcelWriter(output_file, engine='openpyxl') as writer:
        # 为每个文件创建一个工作表，数据按行组织
        for filename, tot_dimensions in data.items():
            # 创建DataFrame，将数据作为一行
            df = pd.DataFrame([tot_dimensions], columns=[f'Value_{i}' for i in range(len(tot_dimensions))])
            df.insert(0, 'File', filename)

            # 工作表名称不能超过31个字符
            sheet_name = filename[:31]
            # 写入Excel
            df.to_excel(writer, sheet_name=sheet_name, index=False)

        # 创建一个汇总工作表，按行组织所有数据
        summary_rows = []
        for filename, tot_dimensions in data.items():
            row = {'File': filename}
            for i, value in enumerate(tot_dimensions):
                row[f'Value_{i}'] = value
            summary_rows.append(row)

        # 确定最大列数
        max_columns = max(len(tot_dimensions) for tot_dimensions in data.values()) if data else 0

        # 创建列名
        columns = ['File'] + [f'Value_{i}' for i in range(max_columns)]

        # 创建汇总DataFrame
        summary_df = pd.DataFrame(summary_rows, columns=columns)
        summary_df.to_excel(writer, sheet_name='Summary', index=False)

def main():
    # 指定目录路径（可以根据需要修改）
    directory_path = "D:\\C++ plus\\DCOs\\src\\script\\tmp"  # 当前目录，可以修改为其他路径

    # 处理文件
    data = process_sta_files(directory_path)

    if not data:
        print("未找到以_sta结尾的.txt文件")
        return

    # 保存到Excel
    output_file = "data_msg.xlsx"
    save_to_excel(data, output_file)

    print(f"数据已保存到 {output_file}")

if __name__ == "__main__":
    main()
