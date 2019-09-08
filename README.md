# **Pipeline to analysis Whole-Exome Sequencing (WES)**

## Overview of workflow


![FlujoDeTrabajo2](https://user-images.githubusercontent.com/53798505/63644484-9ef5dc00-c6af-11e9-9f0d-935508b21613.png)



## Directory organization


The repository is organized as follows

```
+-- workflow_to_analysis_WES

|	+--bin/
|	            +-- 1_FastQC.sh
|	            +-- 2_Alignment.sh
|	            +-- 3_PreprocesingGATK4.sh
|	            +-- 4_Mutect2.sh
|	            +-- 5_CNVkit.sh
|	            +-- 6_MutationalSignature.rmd
|	            +-- 7_Heatmap.rmd
|	+--data/
|	            +-- bam
|	            +-- fastq
|	            +-- sam
|	            +-- vcf
|	+--figure/
|	            +--MutationalSignature.png
|	            +--ComplexHeatmap.png
```

* [**bin**](https://github.com/Martinez-Gregorio-Hector/workflow_to_analysis_WES/tree/master/bin)

* [**data**](https://github.com/Martinez-Gregorio-Hector/workflow_to_analysis_WES/tree/master/data)

* [**figure**](https://github.com/Martinez-Gregorio-Hector/workflow_to_analysis_WES/tree/master/figure)


## Requirements

Before running these scripts, you need to download:

## Data base

  i) [**Human GRCh37/hg19**](http://hgdownload.cse.ucsc.edu/downloads.html#human)
  
## Software
  
  i) [**FastQC_vo.11.8**](https://www.bioinformatics.babraham.ac.uk/projects/download.html#fastqc) 
  
  ii) [**BWA**](https://github.com/lh3/bwa)
  
  iii) [**GATK4**](https://github.com/broadinstitute/gatk#running), this package contains [**Mutect2**](https://www.nature.com/articles/nbt.2514)
  
  iv) [**CNVkit**](https://github.com/etal/cnvkit)
  
  v) [**deconstructSigs**](https://github.com/raerose01/deconstructSigs)
  
  vi) [**ComplexHeatmap**](hthttps://github.com/Martinez-Gregorio-Hector/workflow_to_analysis_WES/tree/master/bintps://github.com/jokergoo/ComplexHeatmap)


