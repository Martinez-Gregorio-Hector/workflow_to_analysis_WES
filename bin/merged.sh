#!/bin/bash

## This command is an issue that i need to correct

awk '{OFS="\t";print "TNBC_033", $0}' TNBC_033.txt  > merged.txt  \
awk '{OFS="\t";print "TNBC_034", $0}' TNBC_034.txt | sed 1d -  >> merged.txt \
awk '{OFS="\t";print "TNBC_035", $0}' TNBC_035.txt | sed 1d -  >> merged.txt 
