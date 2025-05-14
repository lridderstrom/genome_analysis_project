#!/bin/bash -l
#SBATCH -A uppmax2025-3-3
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 16
#SBATCH -t 08:00:00
#SBATCH -J gtdbtk_classify
#SBATCH --mail-type=ALL
#SBATCH --mail-user=linnea.ridderstrom.5181@student.uu.se
#SBATCH --output=gtdbtk_%j.out

#Load modules
module load bioinfo-tools
module load GTDB-Tk/2.4.0

#Pathways
BINS_DIR=/home/liri5181/genome_analysis_project/analyses/dna/03_binning/bins_metabat
OUTPUT_DIR=/home/liri5181/genome_analysis_project/analyses/dna/05_phylogenetic_placement/gtdbtk
mkdir -p $OUTPUT_DIR

#Run GTDB-Tk
gtdbtk classify_wf --genome_dir $BINS_DIR --extension fa --out_dir $OUTPUT_DIR --cpus 16 --skip_ani_screen

