# **README**

These subdirectories contain scripts to analyze WES and is organized as follows.
If you don´t have reads in fastq, sam, bam, and vcf files these could be downloaded [here](https://github.com/Martinez-Gregorio-Hector/workflow_to_analysis_WES/tree/master/data).

**1_FastQC.sh** - Contains scripts to evaluate the quality of the sequenced bases.

**2_Alignment.sh** - Contains script to align the readings using the bwa mem algorithm.

**3_PreprocesingGATK4.sh** - Contains script to preprocessing of data and generate a bam ready to variants calling.

**4_Mutect2.sh** - Contains scripts to call somatic single nucleótide variation (sSNV) using tumor only.

**5_CNVkit.sh** - Contains scripts to call somatic copy nucleótide variation (sCNV).

To run this script we need the following files:

a) files.bed - provided by the vendor or your genes that you are analyzing

b) access-5k-mappable.hg19.bed - is in the folder of data in cnvkit (cnvkit > data > access-5k-mappable.hg19.bed)

c) refFlat.txt - download in http://hgdownload.cse.ucsc.edu/goldenPath/hg19/database/refFlat.txt.gz

**6_MutationalSignature.rmd** - Contains scripts to analyze mutational signature 

**7_Heatmap.rmd** - Contains scripts to plot variants and do heatmaps

