#!/bin/bash -l
#SBATCH -A uppmax2025-3-3
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 08:00:00
#SBATCH -J map_rna_to_bins
#SBATCH --mail-type=ALL
#SBATCH --mail-user=linnea.ridderstrom.5181@student.uu.se
#SBATCH --output=map_rna_%x_%j.out

#Load modules
module load bioinfo-tools
module load bwa
module load samtools

#Pathways
READ1_1=/home/liri5181/genome_analysis_project/data/trimmed_data/SRR4342137.1_trimmed.fastq.gz
READ1_2=/home/liri5181/genome_analysis_project/data/trimmed_data/SRR4342137.2_trimmed.fastq.gz
READ2_1=/home/liri5181/genome_analysis_project/data/trimmed_data/SRR4342139.1_trimmed.fastq.gz
READ2_2=/home/liri5181/genome_analysis_project/data/trimmed_data/SRR4342139.2_trimmed.fastq.gz

ANNOTATED_DIR=/home/liri5181/genome_analysis_project/analyses/dna/04_annotation/prokka_output
OUTPUT_DIR=/home/liri5181/genome_analysis_project/analyses/rna/02_mapping
mkdir -p "$OUTPUT_DIR/location37" "$OUTPUT_DIR/location39"

#Index all bins one time
for BIN_FNA in $ANNOTATED_DIR/*/*.fna; do
  echo "Index $(basename $BIN_FNA)..."
  bwa index "$BIN_FNA"
done

#Loop through all annotated bins at location 37
for BIN_FNA in $ANNOTATED_DIR/*/*.fna; do
  BIN_NAME=$(basename "$BIN_FNA" .fna)

  echo "Map RNA-reads to $BIN_NAME..."
  bwa mem -t 2 "$BIN_FNA" "$READ1_1" "$READ1_2" | samtools sort -@ 2 -o "$OUTPUT_DIR/location37/${BIN_NAME}_rna.bam"

  echo "Index BAM file for $BIN_NAME..."
  samtools index "$OUTPUT_DIR/location37/${BIN_NAME}_rna.bam"
done


#Loop through all annotated bins at location 39
for BIN_FNA in $ANNOTATED_DIR/*/*.fna; do
  BIN_NAME=$(basename "$BIN_FNA" .fna)

  echo "Map RNA-reads to $BIN_NAME..."
  bwa mem -t 2 "$BIN_FNA" "$READ2_1" "$READ2_2" | samtools sort -@ 2 -o "$OUTPUT_DIR/location39/${BIN_NAME}_rna.bam"

  echo "Index BAM file for $BIN_NAME..."
  samtools index "$OUTPUT_DIR/location39/${BIN_NAME}_rna.bam"
done

