# Project Objectives – Amphotericin B Resistance in *Leishmania mexicana*

This document outlines the objectives and tasks completed during a polyomics analysis exploring the molecular basis of Amphotericin B resistance in *Leishmania mexicana*.

---

##Genomic Analysis

- Set up working environment on the MARS cluster and symlink data
- Assess read quality using **FastQC**
- Trim low-quality bases from paired-end reads using **Trim Galore** (phred64 encoding)
- Index the reference genome with **Bowtie2-build**
- Align reads to the reference genome using **Bowtie2**
- Convert SAM to BAM, sort, and index files with **Samtools**
- Add read group tags using **bamaddrg** to prepare for variant calling
- Perform joint variant calling using **FreeBayes** to identify SNPs across wild-type and resistant strains
- Filter high-confidence SNPs using `vcffilter` (QUAL > 20)
- Split multisample VCF files by sample using **bcftools**
- Identify SNPs unique to the resistant strain using `bcftools isec`

---

##SNP Annotation and Functional Interpretation

- Configure and build a custom **SnpEff** database for *Leishmania mexicana*
- Annotate unique SNPs using **SnpEff**
- Extract non-synonymous variants using `vcfEffOnePerLine.pl` and **SnpSift**
- Identify genes affected by moderate- and high-impact mutations
- Use **TriTrypDB** to interpret the biological relevance of annotated genes, focusing on CYP51 and sterol biosynthesis

---

##Coverage Analysis

- Generate bedgraph files using **bamCoverage** to visualize genome coverage
- Calculate median coverage per chromosome using R or Python
- Assess variability in coverage and infer ploidy or structural changes
- Create plots showing differences in chromosomal coverage between resistant and wild-type strains

---

##Metabolomics Analysis

- Analyze samples using Orbitrap Exactive Mass Spectrometry with HILIC chromatography
- Process raw data using PMP (XCMS + MZMatch backend) with the following filters:
  - RSD < 0.5
  - Minimum detections: ≥3 samples
  - Noise filter > 0.8
  - Minimum intensity > 5000
- Normalize and log-transform metabolite intensity data
- Generate PCA plots to assess metabolic clustering
- Visualize key metabolite differences with volcano plots
- Highlight changes in sterol pathway metabolites (e.g., reduced ergosterol, increased cholestane-like sterols)

---

##Structural Modelling

- Align *Leishmania mexicana* CYP51 protein sequence to *L. infantum* template
- Introduce the N176I mutation using **SWISS-MODEL**
- Predict protein localization with **DeepLoc** and **SignalP**
- Dock substrate (obtusifoliol) into wild-type and mutant structures using **SwissDock**
- Visualize docking results and structural changes using **PyMOL** and **ChimeraX**
- Perform molecular dynamics simulations using **UNRES** to assess flexibility and stability differences caused by the mutation

---

##Aim

To integrate genomics, metabolomics, and structural insights to investigate how the N176I mutation in the CYP51 gene contributes to Amphotericin B resistance in *Leishmania mexicana*.