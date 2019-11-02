# **Pyclone: statistical inference of clonal population structure in cancer**

## Bakground

The cancer is a disease caused by progressive acumulation of mutation (SNV and/or CNV) (Vogelstain et al., 2016).

The cancer is an evolutionary process of continuous Darwinian selection caused by the tumor microenviroment and treatments (Greaves & Maley, 2012).

![evolution_cancer](https://user-images.githubusercontent.com/53798505/68075376-77388980-fd6c-11e9-8e48-2ac2567f5949.png)

**Pyclone** is a hierarchical Bayes statistical model to identify and quantify clonal populations in tumors, which extends to modeling mutations measured in multiple samples from the same patients. **Pyclone uses the measured of allelic prevalence to estimate the proportion of tumor cells harboring a mutations.**

To identify and quantify the prevalence of clonal mutation, pyclone assumes that **clonal population follow a perfect** (that is, no site mutatetions more than once in its evolutionary history, and each harbor at most one somatic mutation genotype) and **persistent** (mutations do not disappear or revert) **phylogeny**. These assumptions imply that clusters of mutations ocurring at the same point in the clonal phylogeny are present at shared cellular prevalence. Thus, clusters of mutations can be used as maskers of clonal population.

The inputs to the model are a set of deeply sequenced mutations from one or more samples derived from a single patient and a measure of allele-specific copy number at each mutation locus in each sample.

![workflow](https://user-images.githubusercontent.com/53798505/68076144-9b00cd00-fd76-11e9-8d0b-463bc7ef44c3.png)

The PyClone framework 
First, it uses beta-binomial emission densities, which models data sets with more variance in allelic prevalence measurements more effectively than a binomial model. 
Second, flexible prior probability estimates (‘priors’) of possible mutational genotypes are used, reflecting how allelic prevalence measurements are deterministically linked to zygosity and coincident copy-number variation events.
Third, Bayesian nonparametric clustering is used to discover groupings of mutations and the number of groups simultaneously. This obviates fixing the number of groups a priori and allows for cellular prevalence estimates to reflect uncertainty in this parameter. 
Fourth, multiple samples from the same cancer may be analyzed jointly to leverage the scenario in which clonal populations are shared across samples

