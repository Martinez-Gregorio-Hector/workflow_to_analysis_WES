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
|         +--2.Alignament.sh
|	        +--3.PreprocesingGATKandMutect2.sh
|	        +--4.CNVkit.sh
|         +--5.deconstructSigs.rmd
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
The workflow steps and tools used as


The worflow steps and tools used are as follows:


1. Alignment

To analyze WES, we need to alignment the reads (fastqc) using bwa, you can download this program in https://github.com/lh3/bwa. The script is in the bin file "Alignment"



2. Preprocesing GATK

Before calling variant, the reads alignment are processing with GATK to sort reads, mark reads duplicates and recalibrate the bases, once done this, the bam is ready to call variantes. To this section the script in in the bam file "preprocesing_GATK"


3. Calling Variant with Mutect2



4. Annotation in ANNOVAR



5. Manual filtering


6. Analysis for copy number variation


---
![UNAM](https://user-images.githubusercontent.com/53798505/63645261-b6d55c00-c6bf-11e9-90ba-b84ae7bcb9b7.jpg)
![IZTACZALA](https://user-images.githubusercontent.com/53798505/63645254-8f7e8f00-c6bf-11e9-89ea-3f2df157ce47.jpg)
![LABNACIONAL](https://user-images.githubusercontent.com/53798505/63645263-c94f9580-c6bf-11e9-819d-fd18f49160bb.png)

