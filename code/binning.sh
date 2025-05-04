#!/bin/bash -l
#SBATCH -A uppmax2025-3-3
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 06:00:00
#SBATCH -J metabat_binning
#SBATCH --mail-type=ALL
#SBATCH --mail-user=linnea.ridderstrom.5181@student.uu.se
#SBATCH --output=%x.%j.out

#Load modules
module load bioinfo-tools
module load MetaBat

#Pathways
WD=/home/liri5181/genome_analysis_project/analyses/dna/03_binning
CONTIGS=/home/liri5181/genome_analysis_project/analyses/dna/02_metagenome_assembly/megahit_output/final.contigs.fa

#Create depth-file
jgi_summarize_bam_contig_depths --outputDepth depth.txt $WD/mapped_SRR4342129.bam $WD/mapped_SRR4342133.bam


#Run metabat2
metabat2 -i $CONTIGS -a depth.txt -o $WD/bins --minContig 2500 --minClsSize 200000 -t 2

