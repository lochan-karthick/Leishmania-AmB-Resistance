#!/bin/bash -l

############# SLURM SETTINGS #############

#SBATCH --account=project0026
#SBATCH --job-name=TrimGalore-analysis
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
#SBATCH --output=/mnt/data/project0026/student_data/3046323r/job_logs/slurm.bowtie2_index.out
#SBATCH --error=/mnt/data/project0026/student_data/3046323r/job_logs/slurm.bowtie2_index.err

############# CODE #############

#Paths to Reference and output
REFERENCE_DIR=/mnt/data/project0026/student_data/3046323r/pathogenPolyomicsData/Reference
OUTPUT_DIR=/mnt/data/project0026/student_data/3046323r/bowtie_index_results

# Create output directory
mkdir -p "$OUTPUT_DIR"

# Run bowtie2-build with correct reference filename
bowtie2-build "$REFERENCE_DIR/TriTrypDB-25_LmexicanaMHOMGT2001U1103.fa" \
              "$OUTPUT_DIR/reference_index"

echo "Reference genome indexed successfully in $OUTPUT_DIR"
