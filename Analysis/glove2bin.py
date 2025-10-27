import numpy as np


def write_fbin(filename, vectors):
    """ Write float32 vectors to a *.fbin file
    Args:
        :param filename (str): path to *.fbin file
        :param vectors (numpy.ndarray): array of float32 vectors to write
    """
    nvecs, dim = vectors.shape
    print(f"Writing {nvecs} vectors of dimension {dim} to {filename}")
    with open(filename, "wb") as f:
        np.array([nvecs, dim], dtype=np.int32).tofile(f)
        vectors.astype(np.float32).tofile(f)


def load_glove_model(glove_file):
    print("Loading GloVe Model...")
    model = []
    with open(glove_file, 'r', encoding='utf-8') as f:
        for line in f:
            split_line = line.split()
            word = split_line[0]
            embedding = np.array([float(val) for val in split_line[1:]])
            model.append(embedding)
    write_fbin('/home/zzlin/dataset/glove100/glove100.bin', np.array(model))

    print(f"Loaded {len(model)} words.")
    return model


if __name__ == "__main__":
    model = load_glove_model('/home/zzlin/dataset/glove100/glove.6B.100d.txt')
