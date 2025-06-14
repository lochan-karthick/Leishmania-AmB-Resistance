#!/bin/bash -l

############# SLURM SETTINGS #############

#SBATCH --account=project0026
#SBATCH --job-name=Bowtie2_alignment
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
#SBATCH --output=/mnt/data/project0026/student_data/3046323r/job_logs/slurm.bowtie2_align.out
#SBATCH --error=/mnt/data/project0026/student_data/3046323r/job_logs/slurm.bowtie2_align.err

############# CODE #############

# Set paths
TRIM_DIR=/mnt/data/project0026/student_data/3046323r/trim_results
INDEX_DIR=/mnt/data/project0026/student_data/3046323r/bowtie_index_results
OUT_DIR=/mnt/data/project0026/student_data/3046323r/alignment_results

# Create output directory
mkdir -p "$OUT_DIR"

# List of sample prefixes
samples=("LmexWT" "LmexAmpB")

# Align each sample
for sample in "${samples[@]}"
do
  echo "Aligning $sample"

  bowtie2 -x "$INDEX_DIR/reference_index" \
          -1 "$TRIM_DIR/${sample}_1_trimmed_1.fq.gz" \
          -2 "$TRIM_DIR/${sample}_2_trimmed_2.fq.gz" \
          -S "$OUT_DIR/${sample}.sam" \
          2> "$OUT_DIR/${sample}_alignment.log"

  echo "$sample alignment complete."
done


