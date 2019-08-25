# **Workflow to analysis WES**

This is a tutorial to analysis whole-exome-sequencing (WES), the coding region of genome, you can implement the workflow presented below. Directory [**/bin**](https://github.com/Martinez-Gregorio-Hector/workflow_to_analysis_WES/tree/master/bin) contains the script to analysis WES

## Overview of workflow
---

![FlujoDeTrabajo2](https://user-images.githubusercontent.com/53798505/63644484-9ef5dc00-c6af-11e9-9f0d-935508b21613.png)



## Directory organization
---

```
+-- workflow_to_analysis_WES

|	+--bin/
|	        +--1.FastQC.sh
| 		+--2.Alignament.sh
|	        +--3.PreprocesingGATKandMutect2.sh
|	        +--4.CNVkit.sh
| 		+--5.deconstructSigs.rmd
|	        +--6.ComplexHeatmap.rmd
|	+--data/
|	        +--raw/
|	        +--bam/
|	        +--vcf/
|	+--figure/
|	        +--MutationalSignature.png
|	        +--ComplexHeatmap.png


```


## Requirements
---
Before running these scripts, you need to download some software and data base


  i) [**Human GRCh37/hg19**](http://hgdownload.cse.ucsc.edu/downloads.html#human)
  
  ii) [**FastQC**](https://github.com/s-andrews/FastQC) 
  
  iii) [**BWA**](https://github.com/lh3/bwa)
  
  iv) [**GATK4**](https://github.com/broadinstitute/gatk#running), this package contains [**Mutect2**](https://www.nature.com/articles/nbt.2514)
  
  v) [**CNVkit**](https://github.com/etal/cnvkit)
  
  vi) [**deconstructSigs**](https://github.com/raerose01/deconstructSigs)
  
  vii) [**ComplexHeatmap**](https://github.com/jokergoo/ComplexHeatmap)



Workflow steps
---

The rest of the script either Line Comand or R is in [**/bin**](https://github.com/Martinez-Gregorio-Hector/workflow_to_analysis_WES/tree/master/bin)

  ### Line command 

  1.**_Read quality_**

Quality control of raw reads

```
### A sample
fastqc directory/read1.fastq directorio/reads2.fastq

### Several samples
fastqc directory/*fastq

``` 

  2.**_Mapping_** - see [GATK best practices](https://software.broadinstitute.org/gatk/best-practices/about)

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
SM      Sample ID
PL      platform (Illumina, 454, Ion torrent, Pacbio)
LB      library number (can have multiple libraries for a given individual)
``` 
  
  3.**_Preprocesing_**

  
  4.**_Somatic Variant Calling - SNV_**
  
  5.**_Somatic Variant Calling - CNV_**
  
  
  
  The worflow steps and tools used are as follows:


Map reads to Reference
BWA
Mark Duplicates
GATK MarkDuplicates
Base (Quality Score) Recalibration
GATK BaseRecalibrator
GATK ApplyBQSR
Germline variant calling - germlineVC.nf
SNVs and small indels
GATK HaplotyeCaller
Strelka2
Structural variants
Manta
Somatic variant calling - somaticVC.nf (optional)
SNVs and small indels
MuTect2
Freebayes
Strelka2
Structural variants
Manta
Sample heterogeneity, ploidy and CNVs
ASCAT
Annotation - annotate.nf (optional)
Variant annotation
SnpEff
VEP (Variant Effect Predictor)
Reporting - runMultiQC.nf
Reporting
   ### R

  1.[**_deconstructSigs_**](https://github.com/Martinez-Gregorio-Hector/workflow_to_analysis_WES/tree/master/bin)
  
  Install these packages 
```
source("https://bioconductor.org/biocLite.R")
biocLite("deconstructSigs")
biocLite("BSgenome.Hsapiens.UCSC.hg19")
biocLite("GenomeInfoDb")

``` 
Once installed, deconstructSigs can be loaded:

```
library("deconstructSigs")
library("BSgenome.Hsapiens.UCSC.hg19")
library("GenomeInfoDb")

``` 


  2.[**_ComplexHeatmap_**](https://github.com/Martinez-Gregorio-Hector/workflow_to_analysis_WES/tree/master/bin)
  
Install this packages 
```
library(devtools)
install_github("jokergoo/ComplexHeatmap")

``` 
Once installed, ComplexHeatmap can be loaded:

```
library(ComplexHeatmap)

``` 

---
![NGS](https://user-images.githubusercontent.com/53798505/63645404-403a5d80-c6c3-11e9-83fb-8c6dfbb2698c.png)
