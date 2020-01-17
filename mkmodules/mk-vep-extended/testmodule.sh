#!/usr/bin/env bash
## This small script runs a module test with the sample data

###
## environment variable setting
# VEP_GENOME_VERSION="GRCh38 or GRCh37, for human"
export VEP_GENOME_VERSION="GRCh38"
export GENOME_REFERENCE="test/reference/genome/chr22.fa.gz" # this should point to VEP toplevel fasta
export GNOMAD_REFERENCE="test/reference/gnomAD/sample_gnomAD.vcf.bgz"
export GNOMAD_COVERAGE_REFERENCE="test/reference/gnomAD/sample_gnomAD.coverage.summary.bed.gz"
###

echo "[>..] test running this module with data in test/data"
## Remove old test results, if any; then create test/reults dir
rm -rf test/results
mkdir -p test/results
echo "[>>.] results will be created in test/results"
## Execute runmk.sh, it will find the basic example in test/data
## Move results from test/data to test/results
## results files are *.anno_dbSNP_vep.vcf
./runmk.sh \
&& mv test/data/*.anno_dbSNP_vep.vcf.gz test/results  \
&& echo "[>>>] Module Test Successful"
