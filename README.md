# **Workflow to analysis whole-exomes sequencing to detect genetic alterations in cancer samples**

Cancer is a disease caused by progressive acumulation of genetic alterations either for single nucleotide variation (SNV) and/or copy number variation(CNV). There are some mutations important during initiation, promotion, and progression in cancer. 
However, it is important to identify these genetic alterations in cancer to understand the biology of the tumor as well as to identify genetic alterations that are of clinical importance either as a biomarker or as a therapeutic target.

This genetic alterations are detected using emerging technologies such as Next Generation Sequencing (NGS) with [panels of cancer](https://www.idtdna.com/pages/products/next-generation-sequencing/hybridization-capture/lockdown-panels/xgen-pan-cancer-panel), [exomes](https://www.agilent.com/en/promotions/sureselect-human-all-exon-v7) o [complete genome](https://www.agilent.com/cs/library/usermanuals/Public/G9682-90000.pdf). 


The goal of this repository is show a workflow to analyze whole-exome sequencing (WES) using packages such as GATK4, mutect2, and CNVKit.

This is the general workflow.



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
|	            +-- MutationalSignature
|	            +-- bam
|	            +-- fastq
|	            +-- sam
|	            +-- vcf
|	+--figure/
|	            +--MutationalSignature.png
|	            +--ComplexHeatmap.png
```

* [**bin**](https://github.com/Martinez-Gregorio-Hector/workflow_to_analysis_WES/tree/master/bin): This subdirectory contains the scripts and a README that explain how is organized the workflow to analyze WES.

* [**data**](https://github.com/Martinez-Gregorio-Hector/workflow_to_analysis_WES/tree/master/data): This subdirectory contains data such MutationalSignature, bam, fastq, sam, and vcf files.

* [**figure**](https://github.com/Martinez-Gregorio-Hector/workflow_to_analysis_WES/tree/master/figure): This subdirectory contains images of the R packages


## Requirements

Before run these scripts, you need to download:

### Data base

  i) [**Human GRCh37/hg19**](https://halvade.readthedocs.io/en/latest/contents/references.html)
  
  ```wget ftp://gsapubftp-anonymous@ftp.broadinstitute.org/bundle/hg19/ucsc.hg19.fasta.gz ```
 
  
### Software
  
 ***Line command***
 
  i) [**FastQC_vo.11.8**](https://www.bioinformatics.babraham.ac.uk/projects/download.html#fastqc) 
  
  ii) [**BWA**](https://github.com/lh3/bwa)
  
  iii) [**GATK4**](https://github.com/broadinstitute/gatk#running), this package contains [**Mutect2**](https://www.nature.com/articles/nbt.2514)
  
  iv) [**CNVkit**](https://github.com/etal/cnvkit)
  
***R***
 
  v) [**deconstructSigs**](https://github.com/raerose01/deconstructSigs)
  
  vi) [**ComplexHeatmap**](https://github.com/jokergoo/ComplexHeatmap)


