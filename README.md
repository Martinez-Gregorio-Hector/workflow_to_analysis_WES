# README

This is a tutorial to analysis whole-exome-sequencing (WES), the coding region of genome, you can implement the workflow presented below. Directory [/bin](https://github.com/Martinez-Gregorio-Hector/workflow_to_analysis_WES/tree/master/bin) contains the script used for the workflow to analysis WES

---
Overview of the bioinformatic flow
![FlujoDeTrabajo2](https://user-images.githubusercontent.com/53798505/63644484-9ef5dc00-c6af-11e9-9f0d-935508b21613.png)
---


1. Alignment

To analyze WES, we need to alignment the reads (fastqc) using bwa, you can download this program in https://github.com/lh3/bwa. The script is in the bin file "Alignment"



2. Preprocesing GATK

Before calling variant, the reads alignment are processing with GATK to sort reads, mark reads duplicates and recalibrate the bases, once done this, the bam is ready to call variantes. To this section the script in in the bam file "preprocesing_GATK"


3. Calling Variant with Mutect2

---
#include<iostream>

4. Annotation in ANNOVAR

---

5. Manual filtering


6. Analysis for copy number variation


This part is to analysis mutational signature and to create heatmap using R

1. Mutational signature 


2. Heatmap
