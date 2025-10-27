import pandas as pd

# 读取文件
file_path = 'tmp.txt'
with open(file_path, 'r') as f:
    lines = [line.strip() for line in f.readlines() if line.strip()]

# 分组数据：每 4 行一组（文件名 + 3 行数据）
groups = []
i = 0
while i < len(lines):
    if lines[i].startswith('/'):
        filename = lines[i]
        params = list(map(str, lines[i+1].split()))
        latency = list(map(str, lines[i+2].split()))
        recall = list(map(str, lines[i+3].split()))
        groups.append({
            'filename': filename,
            'params': params,
            'latency': latency,
            'recall': recall
        })
        i += 4
    else:
        i += 1

# 构建 DataFrame：每组占 3 行，横向扩展
max_cols = 17  # 每行 17 个数据点
rows = []

for group in groups:
    # 参数行
    param_row = [group['filename']] + group['params'] + [''] * 2  # 留两个空列分隔
    rows.append(param_row)
    # 延迟行
    latency_row = ['Latency'] + group['latency'] + [''] * 2
    rows.append(latency_row)
    # 召回率行
    recall_row = ['Recall'] + group['recall'] + [''] * 2
    rows.append(recall_row)

# 转为 DataFrame（自动按最长行补 NaN）
df = pd.DataFrame(rows)

# 保存为 Excel
df.to_excel('hnsw_search_results.xlsx', index=False, header=False)
print("✅ 已保存为 'hnsw_search_results.xlsx'")