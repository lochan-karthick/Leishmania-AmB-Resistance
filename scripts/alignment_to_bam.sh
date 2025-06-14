#!/bin/bash -l

############# SLURM SETTINGS #############

#SBATCH --account=project0026
#SBATCH --job-name=Samtools_sort
#SBATCH --partition=nodes
#SBATCH --time=02:00:00
#SBATCH --mem=4G
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --ntasks-per-node=1
#SBATCH --output=/mnt/data/project0026/student_data/3046323r/job_logs/slurm.samtools_sort.out
#SBATCH --error=/mnt/data/project0026/student_data/3046323r/job_logs/slurm.samtools_sort.err
#SBATCH --mail-user=3046323R@student.gla.ac.uk
#SBATCH --mail-type=END
#SBATCH --mail-type=FAIL
#SBATCH --reservation=bioinf_course

############# CODE #############

#Directories:
ALIGN_DIR=/mnt/data/project0026/student_data/3046323r/alignment_results
OUTPUT_DIR=/mnt/data/project0026/student_data/3046323r/sorted_bam

#Creating output directory:
mkdir -p "$OUTPUT_DIR"

#Samples:
samples=("LmexWT" "LmexAmpB")

#Convert SAM to sorted BAM
for sample in "${samples[@]}"
do
  echo "Processing $sample"

  samtools view -bS "$ALIGN_DIR/${sample}.sam" > "$ALIGN_DIR/${sample}.bam"
  samtools sort "$ALIGN_DIR/${sample}.bam" -o "$OUTPUT_DIR/${sample}_sorted.bam"

  echo "Done: ${sample}_sorted.bam"
done

echo "All SAM files converted and sorted."

