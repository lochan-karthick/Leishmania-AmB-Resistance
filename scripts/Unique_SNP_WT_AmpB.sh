#!/bin/bash -l

############# SLURM SETTINGS #############

#SBATCH --account=project0026
#SBATCH --job-name=unique_SNP_WT_and_AmpB
#SBATCH --partition=nodes
#SBATCH --time=04:00:00
#SBATCH --mem=4G
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --ntasks-per-node=1
#SBATCH --mail-user=3046323R@student.gla.ac.uk
#SBATCH --mail-type=END
#SBATCH --mail-type=FAIL
#SBATCH --reservation=bioinf_course
#SBATCH --output=/mnt/data/project0026/student_data/3046323r/job_logs/slurm.unique_snp.out
#SBATCH --error=/mnt/data/project0026/student_data/3046323r/job_logs/slurm.unique_snp.err

############# CODE #############

#Full paths
INPUT_VCF="/mnt/data/project0026/student_data/3046323r/SNP_filter_results/filtered_snps.vcf"
OUTPUT_DIR="/mnt/data/project0026/student_data/3046323r/WT_split_AmpB_SNPS"
ISEC_DIR="${OUTPUT_DIR}/isec_output"
AMPB_DIR="${OUTPUT_DIR}/AmpB_SNP"
WT_DIR="${OUTPUT_DIR}/WT_SNP"

#Create main output directory
mkdir -p $OUTPUT_DIR $AMPB_DIR $WT_DIR $ISEC_DIR

#Sample names
SAMPLE1="WT"
SAMPLE2="AmpB"

#Split the VCF by sample and compress and index
echo "Splitting VCF by sample and compressing and indexing:"
bcftools view -s $SAMPLE1 -c 1 -Oz -o ${OUTPUT_DIR}/${SAMPLE1}.vcf.gz $INPUT_VCF
bcftools index ${OUTPUT_DIR}/${SAMPLE1}.vcf.gz

bcftools view -s $SAMPLE2 -c 1 -Oz -o ${OUTPUT_DIR}/${SAMPLE2}.vcf.gz $INPUT_VCF
bcftools index ${OUTPUT_DIR}/${SAMPLE2}.vcf.gz

#Find SNPs unique to AmpB
echo "Finding SNPs unique to AmpB sample"
bcftools isec -p $ISEC_DIR -n=1 ${OUTPUT_DIR}/${SAMPLE2}.vcf.gz ${OUTPUT_DIR}/${SAMPLE1}.vcf.gz

#Move unique SNP files to corresponding folders
mv ${ISEC_DIR}/0000.vcf ${AMPB_DIR}/${SAMPLE2}_unique.vcf

echo "Done! Unique SNP VCFs saved to:"
echo "- ${AMPB_DIR}/${SAMPLE2}_unique.vcf"

