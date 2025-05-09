#!/bin/bash -l
#SBATCH -A uppmax2025-3-3
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 06:00:00
#SBATCH -J prokka_annotation
#SBATCH --mail-type=ALL
#SBATCH --mail-user=linnea.ridderstrom.5181@student.uu.se
#SBATCH --output=prokka_%x_%j.out

# Load modules
module load bioinfo-tools
module load prokka

# Pathways
BINS_DIR="/home/liri5181/genome_analysis_project/analyses/dna/03_binning/bins_metabat"
OUT_DIR="/home/liri5181/genome_analysis_project/analyses/dna/04_annotation/prokka_output"
mkdir -p $OUT_DIR

# List of high-quality bin files
HIGH_QUALITY_BINS=(
"bin_31.fa"
"bin_2.fa"
"bin_40.fa"
"bin_13.fa"
"bin_44.fa"
"bin_22.fa"
"bin_18.fa"
"bin_15.fa"
"bin_17.fa"
"bin_8.fa"
)

# Loop through each bin and run Prokka
for BIN in "${HIGH_QUALITY_BINS[@]}"; do
    BASENAME=$(basename $BIN .fa)
    prokka --outdir "$OUT_DIR/$BASENAME" --prefix "$BASENAME" --cpus 2 "$BINS_DIR/$BIN"
done

