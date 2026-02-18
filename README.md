[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-22041afd0340ce965d47ae6ef1cefeee28c7c493a6346c4f15d667ab976d596c.svg)](https://classroom.github.com/a/SzF8zjrH)
# Unix Course Final Assignment SNPs vs INDELs (task 3 and 4)
This project compares the distribution of PHRED quality scores and read depth (DP) between SNP and INDEL variants from a VCF file. The goal is to evaluate differences in variant quality between these two variant types.

## Data processing (workflow.sh)

The shell script processes the VCF file and extracts relevant information.

Steps:
1. Remove VCF headers.
2. Create a column identifying variant type (SNP or INDEL).
3. Extract PHRED quality scores (column 6).
4. Extract read depth (DP) from INFO column.
5. Merge all values into one table: `variants_all.tsv`.

```bash
# ./workflow.sh "path-to-data" eg.
./workflow.sh /data-shared/vcf_examples/luscinia_vars.vcf.gz 

```
## Data analysis and plotting (data-analysis.R)

The R script loads the processed table and generates histograms and boxplots comparing SNPs and INDELs.

### PHRED boxplot
![PHRED boxplot](results/box_phred.pdf)
SNPs show higher median and mean PHRED values than INDELs, indicating generally higher sequencing quality, although both groups include extreme outliers (max = 999).
### DP boxplot
![DP boxplot](results/box_dp.pdf)
INDELs tend to have higher median and mean DP than SNPs, reflecting the need for stronger read support to confidently call INDELs.


