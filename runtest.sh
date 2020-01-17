echo -e "======\n Testing NF execution \n======" \
&& rm -rf test/results/ \
&& nextflow run aims_frequencies.nf \
	--vcffile test/data/sample.vcf.gz \
	--reference_dbsnp test/reference/dbsnp/sample_dbSNP.vcf.gz \
	--genome_reference test/reference/genome/chr22.fa.gz \
	--gnomad_reference test/reference/gnomAD/sample_gnomAD.vcf.bgz \
	--gnomad_coverage_reference test/reference/gnomAD/sample_gnomAD.coverage.summary.bed.gz \
	--output_dir test/results \
	-resume \
	-with-report test/results/`date +%Y%m%d_%H%M%S`_report.html \
	-with-dag test/results/`date +%Y%m%d_%H%M%S`.DAG.html \
&& echo -e "======\n AIMS Frequencies: Basic pipeline TEST SUCCESSFUL \n======"
