
# 1. You need download these packages to run deconstructSigs
source("https://bioconductor.org/biocLite.R")
biocLite("deconstructSigs")
biocLite("BSgenome.Hsapiens.UCSC.hg19")
biocLite("GenomeInfoDb")

# 2. Once installed, the packages can be loaded.
library("deconstructSigs")
library("BSgenome.Hsapiens.UCSC.hg19")
library("GenomeInfoDb")

# setwd("/data/Lab13/Hec_prov/") - Your working directory
# Upload your file eithe in CSV or TXT 
AllPatients <- read.csv("AllPatientsMutSig.csv", sep = ",", header = TRUE)
head(AllPatients)


# Convert to deconstructSigs input
sigs.input <- mut.to.sigs.input(mut.ref = AllPatients, 
                                sample.id = "Sample", 
                                chr = "Chr", 
                                pos = "Start", 
                                ref = "Ref", 
                                alt = "Alt")
head (sigs.input)

rownames(sigs.input)

colnames(sigs.input)

# Loop for Signatures

for (i in sigs.input){
AllPatients = whichSignatures(tumor.ref = sigs.input, 
                    signatures.ref = signatures.cosmic, 
                    sample.id = "TNBC037", 
                    contexts.needed = TRUE,
                    tri.counts.method = 'exome')  
}

# Your results also could be save eithe csv or txt 
write.csv(AllPatients, file = "PruebaTNBC037_v.0.1.csv") 


