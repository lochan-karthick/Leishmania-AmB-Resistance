#!/bin/bash -l

############# SLURM SETTINGS #############

#SBATCH --account=project0026
#SBATCH --job-name=SNP_filter
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
#SBATCH --output=/mnt/data/project0026/student_data/3046323r/job_logs/slurm.snp_filter.out
#SBATCH --error=/mnt/data/project0026/student_data/3046323r/job_logs/slurm.snp_filter.err

############# CODE #############

#Moving to the directory with VCF file:
cd /mnt/data/project0026/student_data/3046323r/SNP_calling_results

#Input filenames:
INPUT_VCF="WT_vs_AmpB_snps.vcf"
OUTPUT_DIR="/mnt/data/project0026/student_data/3046323r/SNP_filter_results"
OUTPUT_VCF="${OUTPUT_DIR}/filtered_snps.vcf"

#creating the output directory:
mkdir -p "$OUTPUT_DIR"

#filtering for only SNP's with QUAL>20:
vcffilter -f "QUAL > 20" "$INPUT_VCF" | grep -E '^#|TYPE=snp' > "$OUTPUT_VCF"

echo "SNP's have been filtered and saved in $OUTPUT_VCF"
