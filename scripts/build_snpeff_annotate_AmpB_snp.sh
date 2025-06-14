#!/bin/bash -l

############# SLURM SETTINGS #############

#SBATCH --account=project0026
#SBATCH --job-name=snpeff_build_annotate
#SBATCH --partition=nodes
#SBATCH --time=02:00:00
#SBATCH --mem=4G
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --mail-user=3046323R@student.gla.ac.uk
#SBATCH --mail-type=END
#SBATCH --mail-type=FAIL
#SBATCH --reservation=bioinf_course
#SBATCH --output=/mnt/data/project0026/student_data/3046323r/job_logs/slurm.snpeff_anno.out
#SBATCH --error=/mnt/data/project0026/student_data/3046323r/job_logs/slurm.snpeff_anno.err

############# SNPEFF DATABASE + ANNOTATION #############

#Move to working directory
cd /mnt/data/project0026/student_data/3046323r

#Creating output directory for annotated VCF
mkdir -p /mnt/data/project0026/student_data/3046323r/annotated_AmpB_Snps_results

#Building SnpEff database for Lmex
echo "Building SnpEff database for Lmex..."
snpEff build -c SnpEff.config -gff3 -noCheckCds -noCheckProtein -v Lmex

#Annotating the AmpB SNPs
echo "Annotating AmpB_unique.vcf..."
snpEff -Xmx4g -c SnpEff.config -stats annotated_AmpB_Snps_results/snpEff_summary.html -ud 0 Lmex \
/mnt/data/project0026/student_data/3046323r/WT_split_AmpB_SNPS/AmpB_SNP/AmpB_unique.vcf \
> /mnt/data/project0026/student_data/3046323r/annotated_AmpB_Snps_results/AmpB_annotated.vcf

echo "Annotated VCF saved in: annotated_AmpB_Snps_results"


