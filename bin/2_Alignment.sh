## Alignment 

mkdir -p sam

bwa mem -M -t15 - R \
"@RG\tID:\tSM:\tPL:\tLB:\tPU:" \
../../ref/ucsc.hg19.fasta \
READ1.fastq READ2.fastq > READ_aligned.sam

mv *.sam 

