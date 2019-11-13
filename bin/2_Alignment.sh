######### Alignment ###########
######### Code to aligned fastqc to sam ###

# bwa mem -M -t 6 -R "@RG\tID:\tSM:\tPL:\tPU:\tLB:" [ref.fasta] readN.fastq > aligned.sam

# When
# -M  if a read is split (different parts map to different places) mark all parts other than main as "secondary alignement"
# -R add Read Group description (tID:id.sample\tSM:sample\tPL:plataform\tPU:platform.used\tLB:type.of.library)
# -t treads 
# -readN.fastq Can be single-end or paired-end 

### Doing loops for samples that will be analyzed.

# the files look like as Tumor1.fastq.tar.gz 

tar -zxvf *.tar.gz # Extract the file in TumorN.fastq.tar.gz to generate files TumorN.fastq

mkdir -p ../01_Sam # Make a directory when is saved the alignments


for prefix in $(ls *.fastq | rev | cut -c 7- | rev | uniq); do
bwa mem -M -t 10 -R "@RG\tID:${prefix}\tSM:${prefix}\tPL:illumina\tPU:Lane1\tLB:exome"  \
[reference.fasta] ${prefix}.fastq > ${prefix}.aligned.sam
done

mv *.aligned.sam ../01_Sam/


