#!/bin/bash -l
#SBATCH -A uppmax2025-3-3
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 08:30:00
#SBATCH -J metagenome_assembly
#SBATCH --mail-type=ALL
#SBATCH --mail-user linnea.ridderstrom.5181@student.uu.se
#SBATCH --output=%x.%j.out
# Load modules
module load bioinfo-tools
module load megahit
# Your commands
V=/home/liri5181/genome_analysis_project/analyses/dna/02_metagenome_assembly

megahit -1 SRR4342129_1.paired.trimmed.fastq.gz -2 SRR4342129_2.paired.trimmed.fastq.gz --k-list 45,65,85,105,125 --kmin-1pass -t 2 -o $V/megahit_SRR4342129

megahit -1 SRR4342133_1.paired.trimmed.fastq.gz -2 SRR4342133_2.paired.trimmed.fastq.gz --k-list 45,65,85,105,125 --kmin-1pass -t 2 -o $V/megahit_SRR4342133
