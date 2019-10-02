## Once the software was downloaded and added on the PATH
## Run this command to evalute the quality of raw data

## make a directory when put the fastqc reports

mkdir -p fastqc_reports

## Perform the QC analysis on the raw data using FASTQC

for i in *.fastq; do
fastqc $i 
done 

## move your results in fastqc_reports

mv *.html *.zip fastcq_reports/
