import struct
import numpy as np
from typing import List, Tuple


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


def read_from_fivecs(file_name: str, result_name, num_doc=100000):
    """
    Reads vector data from a binary file.

    Args:
        file_name (str): Path to the binary file.

    Returns:
        Tuple[int, int, List[VectorDataType]]: A tuple containing:
            - dim (int): The dimension of the vectors.
            - ndocs (int): Number of documents.
            - data_list (List[VectorDataType]): List of valid vector data objects.
            :param file_name:
            :param result_name:
            :param num_doc:
    """

    with open(file_name, 'rb') as file:
        # Read nvecs, ndocs, and dim as 4-byte integers
        nvecs, ndocs, dim = struct.unpack('iii', file.read(12))
        print(f"#(vectors) = {nvecs}, #(docs) = {ndocs}, #(dim) = {dim}")

        data_list = []
        data_doc = []
        current_did = 0
        current_did_num = 0
        collect = 0
        for i in range(nvecs):
            # Read vid and did as 4-byte integers
            vid, did = struct.unpack('ii', file.read(8))

            # Read vector data as floats (assuming VectorDimensionType is float)
            vec = list(struct.unpack(f'{dim}f', file.read(dim * 4)))

            if did == current_did and current_did_num < 96:
                current_did_num += 1
                data_doc.append(vec)
                if current_did_num == 96:
                    # print(f"{did} : {current_did_num}")
                    # 将data_doc中的vec合并并加入data_list
                    flat_array = np.array(data_doc).flatten().tolist()
                    data_list.append(flat_array)
                    collect += 1
                    if collect == 100:
                        print("write, query")
                        write_fbin('/home/zzlin/dataset/msmacro/query.bin', np.array(data_list))
                        data_list.clear()

                    if collect == num_doc + 100:
                        print("write data")
                        write_fbin('/home/zzlin/dataset/msmacro/msmacro_base.bin', np.array(data_list))
                        break
                    if len(data_list) % 1000 == 0:
                        print(f"{len(data_list)}")
            elif did != current_did:
                current_did = did
                current_did_num = 1
                data_doc.clear()
                data_doc.append(vec)


        print("done")

    return nvecs, dim, ndocs


if __name__ == "__main__":
    nvecs, ndocs, dim = read_from_fivecs(
        '/home/icypigeon/workspace/data/multivector/ms-macro/msmacro-msmacro-data.fivecs',
        '/home/zzlin/dataset/msmacro/msmacro_base.bin', 100000)
    # nvecs, ndocs, dim = read_from_fivecs(
    #     '/home/icypigeon/workspace/data/multivector/ms-macro/msmacro-msmacro-query.fivecs',
    #     '/home/zzlin/dataset/msmacro/query.bin', 100)
