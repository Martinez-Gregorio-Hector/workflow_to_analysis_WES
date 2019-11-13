
## Once the software was downloaded and added on the PATH you can follow this scripts
## This script is used for calling SNV using Mutect2 (inside in GATK)

##### Your data could be organized in this form

## bin
## data
##    01_fastq
##    02_Sam

# This script is to call variants in mode tumor only


mkdir -p ../data/Gatk07_Mutect2

for i in $(ls *.bam | rev | cut -c 38- | rev | uniq); do
gatk Mutect2 -R /data/Lab13/ref/ucsc.hg19.fasta -I ${i%.*}.aligned.sorted.Dedup.recal.reads.bam -tumor $i  --disable-read-filter MateOnSameContigOrNoMappedMateReadFilter -O ${i%.*}.vcf.gz
done  

mv *.vcf ../Mutect2/

#######

echo done
