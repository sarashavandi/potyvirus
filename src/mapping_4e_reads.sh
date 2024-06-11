
# How to run one single sample
#../apps/hisat2-2.2.1/hisat2 -x ../data/sara/hisat_indices/combined72409388_index -1 ../data/from_yuancong/202303_demultiplexed/1083_S5_R1_001.fastq.gz -2 ../data/from_yuancong/202303_demultiplexed/1083_S5_R2_001.fastq.gz -S ../test.sam --score-min 'L,0,-1.2'

# How to run all samples
echo "Clean up previous SAM files"
rm ../data/sara/sam_bam/*.sam

echo "Start FOR loop"
for fnr1 in ../data/from_yuancong/202303_demultiplexed/*_R1_001.fastq.gz; do
	fnr2=${fnr1%R1_001.fastq.gz}R2_001.fastq.gz
	fn_base=$(basename $fnr1)
	fn_sam=../data/sara/sam_bam/output_${fn_base%R1_001.fastq.gz}.sam
	echo "../apps/hisat2-2.2.1/hisat2 -x ../data/sara/hisat_indices/combined72409388_index -1 $fnr1 -2 $fnr2 -S $fn_sam --score-min 'L,0,-1.2'"
	../apps/hisat2-2.2.1/hisat2 -x ../data/sara/hisat_indices/combined72409388_index -1 $fnr1 -2 $fnr2 -S $fn_sam --score-min 'L,0,-1.2'
done
echo "Done. Thanks mate."
