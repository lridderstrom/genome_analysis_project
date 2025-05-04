#!/bin/bash -l
#SBATCH -A uppmax2025-3-3
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 4
#SBATCH -t 12:00:00
#SBATCH -J checkm_bins_eval
#SBATCH --mail-type=ALL
#SBATCH --mail-user=linnea.ridderstrom.5181@student.uu.se
#SBATCH --output=%x.%j.out

# Load modules
module load bioinfo-tools
module load CheckM/1.1.3

# Define pathways
BINS_DIR=/home/liri5181/genome_analysis_project/analyses/dna/03_binning/bins_metabat
OUTPUT_DIR=/home/liri5181/genome_analysis_project/analyses/dna/03_binning/checkm_output
CHECKM_DB_DIR=/home/liri5181/genome_analysis_project/CheckM_data/2015_01_16

# Define pathway of database for CheckM
checkm data setRoot $CHECKM_DB_DIR

# Create output directory
mkdir -p $OUTPUT_DIR

# Run CheckM
checkm lineage_wf -x fa --reduced_tree -t 4 $BINS_DIR $OUTPUT_DIR

