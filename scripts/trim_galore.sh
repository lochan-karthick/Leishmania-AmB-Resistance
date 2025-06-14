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
#SBATCH --output=/mnt/data/project0026/student_data/3046323r/job_logs/slurm.trimgalore.out
#SBATCH --error=/mnt/data/project0026/student_data/3046323r/job_logs/slurm.trimgalore.err

############# CODE #############

# Make sure job_logs folder exists
mkdir -p /mnt/data/project0026/student_data/3046323r/job_logs

# Set input and output directories
INPUT_DIR=/mnt/data/project0026/student_data/3046323r/pathogenPolyomicsData/DNAseq
OUTPUT_DIR=/mnt/data/project0026/student_data/3046323r/trim_results

# Create output directory if it doesn't exist
mkdir -p "$OUTPUT_DIR"

# Loop through all forward reads and run Trim Galore
for file in $INPUT_DIR/*_1.fastq.gz
do
    sample=$(basename "$file" _1.fastq.gz)
    echo "Running Trim Galore on sample: $sample"

    trim_galore --paired --phred64 --output_dir "$OUTPUT_DIR" \
        "$INPUT_DIR/${sample}_1.fastq.gz" "$INPUT_DIR/${sample}_2.fastq.gz"
done

echo " Trimming complete"

