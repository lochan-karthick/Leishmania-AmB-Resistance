# Amphotericin B Resistance in *Leishmania mexicana*

This repository contains scripts and selected analysis outputs from a multi-omics investigation of amphotericin B (AmB) resistance in *Leishmania mexicana*.

The project combines genomics, metabolomics, and structural modelling to investigate potential mechanisms of drug resistance, including the possible role of the N176I mutation in the CYP51 protein.

## Repository Structure

| Directory | Contents |
|---|---|
| `scripts/` | Bash scripts for genomic analysis on an HPC cluster |
| `results/coverage/` | Coverage analysis notebook and visualisation |
| `results/metabolomics/` | Metabolite intensity, normalisation, PCA, and volcano plots |
| `results/modelling/` | Structural models, docking poses, and protein visualisations |

## Genomic Analysis

The genomic analysis workflow includes:

1. Read trimming using Trim Galore
2. Reference genome indexing using Bowtie2
3. Read alignment using Bowtie2
4. SAM/BAM processing and indexing using SAMtools
5. Joint SNP calling using FreeBayes
6. SNP filtering using vcffilter
7. Sample-specific variant extraction using bcftools
8. Functional variant annotation using SnpEff
9. Non-synonymous variant extraction using SnpSift

The scripts were developed for SLURM job submission on the MARS HPC cluster.

## Coverage Analysis

Genome coverage was analysed using alignment-derived coverage data and bamCoverage.

The Jupyter notebook in `results/coverage/` explores coverage patterns, including differences between wild-type and resistant samples.

## Metabolomics

Metabolomics analysis involved mass spectrometry data processed using XCMS and MZMatch.

The repository includes selected visualisations of metabolite intensities, data normalisation, principal component analysis (PCA), and differential metabolite abundance.

## Structural Modelling

Protein structure and docking analyses used SWISS-MODEL, SwissDock, ChimeraX, DeepLoc, and SignalP.

The figures in `results/modelling/` illustrate structural comparisons, docking poses, and predicted protein localisation.

## Data and Reproducibility

Raw sequencing data, intermediate alignment files, variant calls, and original metabolomics datasets are not included.

The genomics scripts contain cluster-specific paths and settings and require the relevant reference files, input data, software dependencies, and SLURM environment.

Metabolomics and structural modelling were also performed using external and graphical tools. Their original interactive workflows are not fully reproduced by the scripts in this repository.

This repository therefore documents the analysis workflow and selected results rather than providing a fully automated, independently reproducible pipeline.
