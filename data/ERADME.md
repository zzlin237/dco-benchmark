## Prerequisites

```
faiss: 1.9.0
numpy: 2.2.3
```

## Datesets

## DCO

* ADSampling: `./data/adsampling/batch.sh`
* DADE: `./data/dade/batch.sh`
* DDCres: `./data/ddc/batch_res.sh`
* DDCpca:  `./data/ddc/batch_pca.sh`, after the index is established
* DDCopq: `./data/ddc/batch_opq.sh`, after the index is established
* Establish the corresponding index using the preprocessed data

Note: The IP measurement method can be achieved by normalizing the datasets, except for FDScanning and DDCres, which can be used dirctly.



