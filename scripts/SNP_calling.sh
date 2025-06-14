#!/bin/bash -l

############# SLURM SETTINGS #############

#SBATCH --account=project0026
#SBATCH --job-name=SNP_call
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
#SBATCH --output=/mnt/data/project0026/student_data/3046323r/job_logs/slurm.snp_call.out
#SBATCH --error=/mnt/data/project0026/student_data/3046323r/job_logs/slurm.snp_call.err

############# CODE #############

#Moving to the directory with BAM_indexed files:
cd /mnt/data/project0026/student_data/3046323r/sorted_bam

#Input filenames:
WT_BAM="LmexWT_sorted.bam"
AMPB_BAM="LmexAmpB_sorted.bam"

#Setting the reference path:
REFERENCE="/mnt/data/project0026/student_data/3046323r/pathogenPolyomicsData/Reference/TriTrypDB-25_LmexicanaMHOMGT2001U1103.fa"

#Creating Output directory
OUTPUT_DIR="/mnt/data/project0026/student_data/3046323r/SNP_calling_results"
mkdir -p "$OUTPUT_DIR"

#VCF file path:
OUTPUT_VCF="$OUTPUT_DIR/WT_vs_AmpB_snps.vcf"

#Calling SNP's with ploidy at 2:
bamaddrg -b "$WT_BAM" -s WT -b "$AMPB_BAM" -s AmpB | \
freebayes --stdin --ploidy 2 --fasta-reference "$REFERENCE" > "$OUTPUT_VCF"
