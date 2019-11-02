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

Example of paper Uluah et al. 2018

They used PyClone-beta-binomial model with all model’s parameter values set to recommended values 
We set the cellular prevalence cut-off to 0.04 and 0.02 and compared it to CP cut-off of 0.05 to check if the seeding patterns are altered. 
Regarding the number of iterations in MCMC, the following criterion was used. If the number of samples in patient were less than 5, 10000 iterations were used; if the number of samples in a patient were between 5 and 7, 15000 iterations were used; if the number of samples in a patient were between 7 and 10, 20000 iterations were used; and if the number of samples were more than 10, 50000 iterations were used. The first 25% percent iterations were thrown as burnin, thereafter every 10th sample was considered, i.e., a thinning value of 10 was used. To test convergence, we ran two independent PyClone analyses for each patient and compared the results. For patient 11, we found that using 15000 iterations for MCMC sampling were not enough for convergence. Subsequently, we used 30000 iterations and observed convergence.

Workflow

![workflow_Uluah](https://user-images.githubusercontent.com/53798505/68076412-ae616780-fd79-11e9-8f55-4dca3dca4b26.png)




