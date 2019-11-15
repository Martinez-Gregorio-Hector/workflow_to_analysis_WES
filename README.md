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
|	            +-- README.md
|	+--data/
|	            +-- HeatMap
|	            +-- MutationalSignature
|	            +-- VariantsToStack
|	            +-- bam
|	            +-- fastq
|	            +-- sam
|	            +-- vcf
|	+--figures/
|	            +-- Heatmap.pdf
|	            +-- SignatureCancer.jpeg
|	+--Presentation.md
|	+--README.md
```

* [**bin**](https://github.com/Martinez-Gregorio-Hector/workflow_to_analysis_WES/tree/master/bin): Contains the scripts to analyze WES and they are sorted as follows:

1_FastQC.sh - Contains scripts to evaluate the quality of the sequenced bases, the input file for this scrit are [fastq file](https://github.com/Martinez-Gregorio-Hector/workflow_to_analysis_WES/tree/master/data/fastq).

2_Alignment.sh - Contains script to align the readings using the bwa mem algorith, the input file for this scritp are [fastq file](https://github.com/Martinez-Gregorio-Hector/workflow_to_analysis_WES/tree/master/data/fastq).

3_PreprocesingGATK4.sh - Contains script to preprocessing of data and generate a bam ready to variants calling, the input for this script is the outpur of 2_Alignment.sh or [sam file](https://github.com/Martinez-Gregorio-Hector/workflow_to_analysis_WES/tree/master/data/sam).

4_Mutect2.sh - Contains scripts to call somatic single nucleótide variation (sSNV) using tumor only, the input for this script is the output of 3_PreprocesingGATK4.sh or [bam file](https://github.com/Martinez-Gregorio-Hector/workflow_to_analysis_WES/tree/master/data/bam).

5_CNVkit.sh - Contains scripts to call somatic copy nucleótide variation (sCNV), the input for this script are [bam file](https://github.com/Martinez-Gregorio-Hector/workflow_to_analysis_WES/tree/master/data/bam).

6_MutationalSignature.rmd - Contains scripts to analyze mutational signature, an example file used for this analysis is in  [Mutational Signature](https://github.com/Martinez-Gregorio-Hector/workflow_to_analysis_WES/tree/master/data/MutationalSignature).

7_Heatmap.rmd - Contains scripts to plot variants and do heatmaps, an example file used for this analysis is in  [HeatMap](https://github.com/Martinez-Gregorio-Hector/workflow_to_analysis_WES/tree/master/data/HeatMap).

* [**data**](https://github.com/Martinez-Gregorio-Hector/workflow_to_analysis_WES/tree/master/data): This directory contains different types of files that are used to execute the scripts.
1. The fastq file contains data of breast cancer patients that were sequenced by the Ilumina HiSeq 2500 team, this file is the starting format for executing the first two script, fastqc and alignment.
2. The sam file is the result of the alignment that was generated from the fastq files and the input file for data preprocessing.
3. The bam file is the result of the data preprocessing and the input file for the so-called single-nucleotide variants and the number of copies.
4. The vcf file is the file that is obtained after the call of bases and that contains the information of the genetic alterations found in these patients.
5. The HeatMap file contains the data to run the HeatMap script and generate figures with the mutations found in these patients.
6. The MutationalSignature file contains data to run the 6_MutationalSignature.Rmd script and analyze mutagenic signatures to identify which mutagenic processes have operated in the life of these patients.

* [**figures**](https://github.com/Martinez-Gregorio-Hector/workflow_to_analysis_WES/tree/master/figures): Figures performed in the R package
                

## Requirements

Before run these scripts, you need to download:

### Data base

  i) [**Human GRCh37/hg19**](https://halvade.readthedocs.io/en/latest/contents/references.html)
  
```  
# For download Human GRCh37/hg19 move to data directory. Once in data make a directory

mkdir reference
cd reference 

# Once in reference, execute the following command.

wget ftp://gsapubftp-anonymous@ftp.broadinstitute.org/bundle/hg19/ucsc.hg19.fasta.gz 
```
 
  
### Software
  
 ***Line command***
 
  i) [**FastQC_vo.11.8**](https://www.bioinformatics.babraham.ac.uk/projects/download.html#fastqc) 
  
  ii) [**BWA**](https://github.com/lh3/bwa)
  
  iii) [**GATK4**](https://github.com/broadinstitute/gatk#running), this package contains [**Mutect2**](https://www.nature.com/articles/nbt.2514)
  
  iv) [**CNVkit**](https://github.com/etal/cnvkit)
  
  
***R***
 
  v) [**deconstructSigs**](https://github.com/raerose01/deconstructSigs)
  
  vi) [**ComplexHeatmap**](https://github.com/jokergoo/ComplexHeatmap)


