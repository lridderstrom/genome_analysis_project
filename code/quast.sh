#!/bin/bash -l
#SBATCH -A uppmax2025-3-3
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 03:00:00
#SBATCH -J quast_metagenome_evaluation
#SBATCH --mail-type=ALL
#SBATCH --mail-user=linnea.ridderstrom.5181@student.uu.se
#SBATCH --output=%x.%j.out

# Loead module
module load bioinfo-tools
module load quast

# Set pathways
ASSEMBLY=/home/liri5181/genome_analysis_project/analyses/dna/02_metagenome_assembly/megahit_output/final.contigs.fa
OUTDIR=/home/liri5181/genome_analysis_project/analyses/dna/02_metagenome_assembly/quast_output

# Kör QUAST
quast.py \
  --threads 2 \
  --min-contig 1000 \
  -o $OUTDIR \
  $ASSEMBLY

