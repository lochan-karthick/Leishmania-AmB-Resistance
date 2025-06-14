#!/bin/bash -l

############# SLURM SETTINGS #############

#SBATCH --account=project0026
#SBATCH --job-name=non_synonymous_variants
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
#SBATCH --output=/mnt/data/project0026/student_data/3046323r/job_logs/slurm.non_syn.out
#SBATCH --error=/mnt/data/project0026/student_data/3046323r/job_logs/slurm.non_syn.err

############# CODE #############
# Set working and output directories
WORK_DIR=/mnt/data/project0026/student_data/3046323r/annotated_AmpB_Snps_results
OUTPUT_DIR=/mnt/data/project0026/student_data/3046323r/non_synonymous_results

# Create output directory
mkdir -p $OUTPUT_DIR

# Run the extraction
cat $WORK_DIR/AmpB_annotated.vcf \
| vcfEffOnePerLine.pl \
| SnpSift extractFields - \
CHROM POS REF ALT "ANN[*].IMPACT" "ANN[*].EFFECT" "ANN[*].GENE" "ANN[*].HGVS_C" "ANN[*].HGVS_P" "GEN[*].GT" \
| grep -E 'HIGH|MODERATE' \
> $OUTPUT_DIR/non_synonymous_AmpB.tsv

echo "Output saved to: $OUTPUT_DIR/non_synonymous_AmpB.tsv"
