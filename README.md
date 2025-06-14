# Amphotericin B Resistance in *Leishmania mexicana*: A Polyomics Analysis

This repository contains scripts and documentation for a multi-omics investigation into Amphotericin B (AmB) resistance in *Leishmania mexicana*.
The project combines **genomics**, **metabolomics**, and **structural modeling** to investigate how the N176I mutation in the CYP51 gene may contribute to AmB resistance.

---

##Project Structure

Leishmania-AmB-Resistance/
├── scripts/ # Bash scripts for the genomics pipeline
├── results/
│ ├── coverage/ # Coverage plots and bedgraph files
│ ├── metabolomics/ # PCA plots, volcano plots, etc.
│ └── structural_modelling/ # Structure visualizations, docking outputs
├── OBJECTIVES.md # Session-wise objectives and tasks
├── README.md # Project overview and documentation
└── .gitignore # Ignored files and folders

---

##Genomic Analysis Pipeline

- Read trimming using **Trim Galore**
- Reference genome indexing using **Bowtie2-build**
- Read alignment with **Bowtie2**
- Conversion and sorting of SAM to BAM using **Samtools**
- BAM indexing for SNP calling
- Joint SNP calling using **FreeBayes**
- SNP filtering using **vcffilter**
- VCF sample splitting and unique SNP extraction using **bcftools**
- Variant annotation using **SnpEff**
- Non-synonymous mutation extraction using **SnpSift**

Scripts for all steps are in the `scripts/` folder and designed for SLURM job submission on the MARS HPC cluster.

---

##Coverage Analysis

- Genome-wide and per-chromosome coverage computed using `bamCoverage`
- Median coverage and variability analyzed in `results/coverage/coverage_explore.ipynb`
- Visualizations highlight ploidy differences and structural variation in resistant vs. wild-type strains


---

##Metabolomics & Structural Modelling

These analyses were performed manually using GUI and online tools.

##Metabolomics:
- Mass spectrometry analysis using Orbitrap Exactive
- Processed via XCMS + MZMatch
- Normalized, filtered data visualized with PCA and volcano plots
- Files stored in `results/metabolomics/`

##Structural Modelling:
- Homology modelling with SWISS-MODEL
- Docking with SwissDock and visualized in ChimeraX
- Subcellular localization predicted using DeepLoc and SignalP
- Figures saved in `results/structural_modelling/`