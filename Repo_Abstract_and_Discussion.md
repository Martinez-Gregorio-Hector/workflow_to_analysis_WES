##  Abstract and discussion of the repository

In the age of technology, it is important to know the genetic composition of different diseases to understand biology and seek molecular biomarkers that have an impact on the clinic and treatments that impact on a better life in patients.

Sanger sequencing has been the gold standard for the detection of single nucleotide variation (SNV) or copy number variation (CNV), with the advent of emerging technology such as next generation sequencing (NGS), hundreds and thousands of genes can be analyzed to identify important genetic alterations in cancer in a single run.

For this reason, the following repository presents a bioinformatic workflow for the detection of these genetic alterations in sequencing of complete exomes. The repository has three directories and a [README](https://github.com/Martinez-Gregorio-Hector/workflow_to_analysis_WES) that explains the workflow. This repository can be used to identify genetic alterations in different tumors or other diseases not related to cancer.

Most studies use bwa for alignment and GATK for data preprocessing. In this repository Mutect2 and CNVkit were used to identify variants of SNV and CNV, which can be replaced by other callers such as VarScan2, Strelka, TitanCNV, and others. The data that was obtained and used in this laboratory corresponds to the laboratory 13 of the FES Iztacala. For the discussion and the improvement of the script you can contact me by this way.
