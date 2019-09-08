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

## bin



```### /bin/


## Requirements
---
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


### /bin/

Contain the script to analize WES


### /data/

Contain data which you use to stablish your workflow, this directory contains [**fastq file**](https://github.com/Martinez-Gregorio-Hector/workflow_to_analysis_WES/tree/master/data/fastq), [**sam file**](https://github.com/Martinez-Gregorio-Hector/workflow_to_analysis_WES/tree/master/data/sam), [**bam file**](https://github.com/Martinez-Gregorio-Hector/workflow_to_analysis_WES/tree/master/data/bam), and [**vcf](https://github.com/Martinez-Gregorio-Hector/workflow_to_analysis_WES/tree/master/data/vcf). You can download the several file and run the [**script**](https://github.com/Martinez-Gregorio-Hector/workflow_to_analysis_WES/tree/master/bin).

### /figure/ 

In construction

### /meta/ 


Workflow steps
---

  ### Line command 

  1. **_Read quality_**

Quality control of raw reads

```
### A sample
fastqc directory/read1.fastq directorio/reads2.fastq

### Several samples
fastqc directory/*.fastq

``` 

  2. **_Mapping_** - see [GATK best practices](https://software.broadinstitute.org/gatk/best-practices/about)

Map reads to Reference, more information [**here**](https://gatkforums.broadinstitute.org/gatk/discussion/4805/how-to-use-bwa-mem-for-paired-end-illumina-reads)

```
### Run

bwa mem -M -t 10 -R '@RG\tID:see_below\tSM:see_below\tPL:see_below\tLB:see_below' \
directory/reference.fasta read1.fastq read2.fastq > ReadAligned.sam

mem     BWA-MEM algorithm
-M      Mark shorter split hits as secondary
-t      Number of threads
-R      Complete read group header line. ’\t’ can be used in STR and will be converted to a TAB 
        in the output SAM. The read group ID will be attached to every read in the output
@RG     An indicator that this line is a read group identifier line
ID      Group ID
SM      Sample ID### /bin/
PL      platform (Illumina, 454, Ion torrent, Pacbio)
LB      library number (can have multiple libraries for a given individual)
``` 

  3. **_Preprocesing_**
  
For steps 3-5 see [**/bin**](https://github.com/Martinez-Gregorio-Hector/workflow_to_analysis_WES/tree/master/bin)
 ```
### Mark Duplicates
gatk MarkDuplicates

### Base (Quality Score) Recalibration
 gatk BaseRecalibrator
 gatk BaseRecalibrator


``` 
  
  4. **_Somatic Variant Calling - SNV_**
  
More information in [**GATK4 Mutect2**](https://gatkforums.broadinstitute.org/gatk/discussion/11136/how-to-call-somatic-mutations-using-gatk4-mutect2-deprecated)
  
  
  5. **_Somatic Variant Calling - CNV_**
  
 CNVkit needs python to run, see [**CNVKit**](https://github.com/etal/cnvkit) to install the software
  



---
![NGS](https://user-images.githubusercontent.com/53798505/63645404-403a5d80-c6c3-11e9-83fb-8c6dfbb2698c.png)
