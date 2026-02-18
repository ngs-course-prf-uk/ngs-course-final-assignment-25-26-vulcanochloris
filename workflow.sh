
#!/bin/bash

IN=/data-shared/vcf_examples/luscinia_vars.vcf.gz

zcat $IN | grep -v '^#' > luscinia_noheader.vcf

awk '{if($8 ~ /INDEL/) print "INDEL"; else print "SNP"}' luscinia_noheader.vcf > col_type.tsv

awk '{print $6}' luscinia_noheader.vcf > col_phred.tsv

grep -o 'DP=[^;]*' luscinia_noheader.vcf | sed 's/DP=//' > col_dp.tsv

wc -l col_type.tsv col_phred.tsv col_dp.tsv

paste col_type.tsv col_phred.tsv col_dp.tsv > variants_all.tsv

