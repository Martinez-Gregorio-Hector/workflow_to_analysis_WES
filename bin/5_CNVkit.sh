## Once the software was downloaded and added on the PATH follow this script 

##### Your data could be organized in this form

## bin
## data
##    Tumoral   ### Contains bams of tumoral samples
##    Normal    ### Contains bams of normal samples


## This script is to generate cns and cnr which is used to call somatic copy number variations (sCNV)
## Exome_Probes.bed is provided by the vendor or your genes that you are analyzing
## Access-5k-mappable.hg19.bed - is in the folder of data in cnvkit (cnvkit > data > access-5k-mappable.hg19.bed)

mkdir ../data/results_cnvkit

cnvkit.py batch ../data/Tumoral/*.bam --normal ../data/Normal/*.bam \
Exome_Probes.bed --annotate refFlat(Is optional) --fasta "reference.fasta" \
--access /cnvkit/data/access-5k-mappable.hg19.bed --output-reference my_reference \
--output-dir ../data/results_cnvkit --diagram --scatter

## This script is to call sCNV

mkdir ../data/call_cnv

cnvkit.py call *.cns -o mkdir ../data/call_cnv


