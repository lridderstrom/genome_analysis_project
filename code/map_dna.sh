#!/bin/bash -l
#SBATCH -A uppmax2025-3-3
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 08:00:00
#SBATCH -J mapping_dna_reads
#SBATCH --mail-type=ALL
#SBATCH --mail-user=linnea.ridderstrom.5181@student.uu.se
#SBATCH --output=%x.%j.out

#Load modules
module load bioinfo-tools
module load bwa
module load samtools

#Pathways
CONTIGS=/home/liri5181/genome_analysis_project/analyses/dna/02_metagenome_assembly/megahit_output/final.contigs.fa
READ1=/home/liri5181/genome_analysis_project/data/raw_data/SRR4342129_1.paired.trimmed.fastq.gz 
READ2=/home/liri5181/genome_analysis_project/data/raw_data/SRR4342129_2.paired.trimmed.fastq.gz
READ3=/home/liri5181/genome_analysis_project/data/raw_data/SRR4342133_1.paired.trimmed.fastq.gz
READ4=/home/liri5181/genome_analysis_project/data/raw_data/SRR4342133_2.paired.trimmed.fastq.gz
OUTDIR=/home/liri5181/genome_analysis_project/analyses/dna/03_binning

#Index contigs
bwa index $CONTIGS

#Map reads to contigs
bwa mem -t 2 $CONTIGS $READ1 $READ2 | samtools sort -@ 2 -o $OUTDIR/mapped_SRR4342129.bam
bwa mem -t 2 $CONTIGS $READ3 $READ4 | samtools sort -@ 2 -o $OUTDIR/mapped_SRR4342133.bam


#Index 
samtools index $OUTDIR/mapped_SRR4342129.bam
samtools index $OUTDIR/mapped_SRR4342133.bam
