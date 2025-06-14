#!/bin/bash -l

############# SLURM SETTINGS #############

#SBATCH --account=project0026
#SBATCH --job-name=BAM_indexing
#SBATCH --partition=nodes
#SBATCH --time=01:00:00
#SBATCH --mem=2G
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --ntasks-per-node=1
#SBATCH --output=/mnt/data/project0026/student_data/3046323r/job_logs/slurm.bam_index.out
#SBATCH --error=/mnt/data/project0026/student_data/3046323r/job_logs/slurm.bam_index.err
#SBATCH --mail-user=3046323R@student.gla.ac.uk
#SBATCH --mail-type=END
#SBATCH --mail-type=FAIL
#SBATCH --reservation=bioinf_course

############# CODE ###########

#Input and output directories
BAM_DIR=/mnt/data/project0026/student_data/3046323r/sorted_bam
OUTPUT_DIR=/mnt/data/project0026/student_data/3046323r/bam_indexed

# Create output directory for .bai files
mkdir -p "$OUTPUT_DIR"

# List of samples
samples=("LmexWT" "LmexAmpB")

# Index each sorted BAM and write .bai to INDEX_DIR
for sample in "${samples[@]}"
do
    echo "Indexing $sample"
    samtools index "$BAM_DIR/${sample}_sorted.bam" "$OUTPUT_DIR/${sample}_sorted.bam.bai"

done

echo "All BAM files indexed and saved in $OUTPUT_DIR"

