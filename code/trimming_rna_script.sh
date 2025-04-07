#!/bin/bash -l
#SBATCH -A uppmax2025-3-3
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 06:00:00
#SBATCH -J trimming_rna_data
#SBATCH --mail-type=ALL
#SBATCH --mail-user linnea.ridderstrom.5181@student.uu.se
#SBATCH --output=%x.%j.out
# Load modules
module load bioinfo-tools
module load trimmomatic
# Your commands
WD=/home/liri5181/genome_analysis_project/data/trimmed_data

java -jar /sw/bioinfo/trimmomatic/0.39/snowy/trimmomatic-0.39.jar PE -threads 2  -phred33 SRR4342137.1.fastq.gz SRR4342137.2.fastq.gz $WD/SRR4342137.1_trimmed $WD/SRR4342137.1_discard $WD/SRR4342137.2_trimmed $WD/SRR4342137.2_discard ILLUMINACLIP:TruSeq3-PE.fa:2:30:10 SLIDINGWINDOW:4:15 

java -jar /sw/bioinfo/trimmomatic/0.39/snowy/trimmomatic-0.39.jar PE -threads 2  -phred33 SRR4342139.1.fastq.gz SRR4342139.2.fastq.gz $WD/SRR4342139.1_trimmed $WD/SRR4342139.1_discard $WD/SRR4342139.2_trimmed $WD/SRR4342139.2_discard ILLUMINACLIP:TruSeq3-PE.fa:2:30:10 SLIDINGWINDOW:4:15
