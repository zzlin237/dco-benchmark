import matplotlib.pyplot as plt

data = {
    "32": 10340.000000,
    "64": 307345.000000,
    "96": 3520114.000000,
    "128": 5208152.000000
}

idx = 0
idy = 1

dataset = ['YouTube', 'deep', 'gist', 'OpenAIArXiv', 'trevi', 'wiki', 'test2image']
op = ['FScanning', 'PScanning', 'RPScanning', 'ADSampling', 'DADE', 'DDCres', 'DDCpca', 'DDCopq']

x_values = list(data.keys())
y_values = list(data.values())

plt.figure(figsize=(15, 8))
bars = plt.bar(x_values, y_values, color='skyblue')

plt.title(f'{dataset[idx]}_{op[idy]}')
plt.xlabel('Scanning')
plt.ylabel('Num')

plt.xticks(rotation=45, ha='right')

for bar, value in zip(bars, y_values):
    plt.text(bar.get_x() + bar.get_width() / 2, bar.get_height() + 10000,
             f'{int(value):,}', ha='center', va='bottom', fontsize=8)

plt.tight_layout()

plt.savefig(f'picture/{dataset[idx]}_{op[idy]}.png', dpi=300, bbox_inches='tight')

# plt.show()

print(f"save '{dataset[idx]}_{op[idy]}.png'")
