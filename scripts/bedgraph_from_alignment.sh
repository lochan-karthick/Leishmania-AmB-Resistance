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
#SBATCH --output=/mnt/data/project0026/student_data/3046323r/job_logs/slurm.Bedgraph.out
#SBATCH --error=/mnt/data/project0026/student_data/3046323r/job_logs/slurm.Bedgraph.err

############# CODE #############

#Output and Input Directory:
OUTPUT_DIR="/mnt/data/project0026/student_data/3046323r/coverage_results"
BAM_DIR="/mnt/data/project0026/student_data/3046323r/sorted_bam/"

#Creating the Output Directory:
mkdir -p "$OUTPUT_DIR"

#Looping throught the sorted_bam files:
WT_BAM="LmexWT_sorted.bam"
AMPB_BAM="LmexAmpB_sorted.bam"

#For the wild type:
bamCoverage -b "$BAM_DIR/$WT_BAM" -o "$OUTPUT_DIR/LmexWT.bedgraph" --outFileFormat bedgraph \
    --binSize 1 --normalizeUsing CPM

#For the resistant type:
bamCoverage -b "$BAM_DIR/$AMPB_BAM" -o "$OUTPUT_DIR/LmexAmpB.bedgraph" \
    --outFileFormat bedgraph --binSize 1 --normalizeUsing CPM

echo "Bedgraphs created"
