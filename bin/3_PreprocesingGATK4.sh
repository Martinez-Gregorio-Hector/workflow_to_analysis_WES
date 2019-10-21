
## Once the software was downloaded and added on the PATH
## This script is used for data preprocessing and generates a bam file ready for variant calling. It contains 6 steps

## ##### Your data could be organized in this form

```
  bin
  data
      01_fastq 
      02_Sam 
```

## 1. SortSam
# This tool sorts the input SAM or BAM file by coordinate, queryname (QNAME), or some other property of the SAM record.
# The SortOrder of a SAM/BAM file is found in the SAM file header tag @HD in the field labeled SO.


mkdir -p ../data/Gatk01_SortSam

for i in ../data/02_Sam/*.sam;do
gatk SortSam -I $i -O ${i%.*}.sorted.sam -SO coordinate
done

mv ../data/02_Sam/*.sorted.sam ../data/Gatk01_SortSam/

## 2. SamFormatConverter
# Convert a BAM file to a SAM file, or SAM to BAM. Input and output formats are determined by file extension.

mkdir -p ../data/Gatk02_SamFormatConverter

for i in ../data/Gatk01_SortSam/*.sam;do
gatk SamFormatConverter -I $i -O ${i%.*}.bam
done

mv ../data/Gatk01_SortSam/*.bam ../data/Gatk02_SamFormatConverter/

## 3. MarkDuplicates
# This tool locates and tags duplicate reads in a BAM or SAM file, where duplicate reads are defined as originating from a single fragment of DNA.
# Duplicates can arise during sample preparation e.g. library construction using PCR.
# Duplicates not have a origen biological

mkdir -p ../data/Gatk03_MarkDuplicates

for i in ../data/Gatk02_SamFormatConverter/*.bam;do
gatk MarkDuplicates -I $i -O ${i%.*}.Dedup.bam -M ${i%.*}.metrics.txt
done

mv ../data/Gatk02_SamFormatConverter/*.Dedup.bam ../data/Gatk02_SamFormatConverter/*.metrics.txt ../data/Gatk03_MarkDuplicates/

##  4. BuildBamIndex
# Generates a BAM index ".bai" file. 
# This tool creates an index file for the input BAM that allows fast look-up of data in a BAM file, like an index on a database. 

mkdir -p ../data/Gatk04_BuildBamIndex

for i in ../data/Gatk03_MarkDuplicates/*.bam;do
gatk BuildBamIndex -I $i
done

mv ../data/Gatk03_MarkDuplicates/*.bai ../data/Gatk04_BuildBamIndex/

## 5. BaseRecalibrator
# First pass of the base quality score recalibration. Generates a recalibration table based on various covariates and after applied in final bam

mkdir -p ../data/Gatk05_BaseRecalibrator

for i in ../data/Gatk03_MarkDuplicates/*.bam;do
gatk BaseRecalibrator -R /data/Lab13/ref/ucsc.hg19.fasta -I $i -O ${i%.*}.recal.data.table
done

## 6. ApplyBQSR
# Apply base quality score recalibration

mkdir -p ../data/Gatk06_ApplyBQSR

for prefix in $(ls ../Gatk03_MarkDuplicates/*.bam | rev | cut -c 5- | rev | uniq); do
ApplyBQSR -R /data/Lab13/ref/ucsc.hg19.fasta -I ${prefix}.bam --bqsr-recal-file ${prefix}.recal.data.table -O ${prefix}.recal.reads.bam
done

mv ../data/Gatk03_MarkDuplicates/*.recal.reads.bam ../data/Gatk03_MarkDuplicates/*.recal.reads.bai \
../data/Gatk03_MarkDuplicates/*.recal.data.table ../data/Gatk06_ApplyBQSR/

###########################

echo done
