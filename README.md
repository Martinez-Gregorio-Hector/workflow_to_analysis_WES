# **Workflow to analysis WES**

This is a tutorial to analysis whole-exome-sequencing (WES), the coding region of genome, you can implement the workflow presented below. Directory [/bin](https://github.com/Martinez-Gregorio-Hector/workflow_to_analysis_WES/tree/master/bin) contains the script to analysis WES

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
  1.**__**
  2.**_Preprocesing_**
  

The worflow steps and tools used are as follows:

Preprocessing - main.nf (based on GATK best practices)
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




