#!/bin/bash -l
#SBATCH -A uppmax2025-3-3
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 10:00:00
#SBATCH -J htseq_count
#SBATCH --mail-type=ALL
#SBATCH --mail-user=linnea.ridderstrom.5181@student.uu.se
#SBATCH --output=htseq_%x_%j.out

#Load modules
module load bioinfo-tools
module load htseq/0.12.4

#Pathways
ANNOTATED_DIR=/home/liri5181/genome_analysis_project/analyses/dna/04_annotation/prokka_output
MAPPING_DIR=/home/liri5181/genome_analysis_project/analyses/rna/02_mapping
COUNTS_DIR=/home/liri5181/genome_analysis_project/analyses/rna/03_read_counting
mkdir -p "$COUNTS_DIR/location37" "$COUNTS_DIR/location39"

#Create a function: Run HTseq for one location
run_htseq_counts() {
  LOCATION=$1
  echo ">> Starts HTseq for $LOCATION"
  
  for BAM in $MAPPING_DIR/$LOCATION/*.bam; do
    BIN_NAME=$(basename "$BAM" _rna.bam)
    GFF_CLEAN=$ANNOTATED_DIR/$BIN_NAME/${BIN_NAME}_clean.gff
	
    if [[ -f "$GFF_CLEAN" ]]; then

      echo "HTSeq-count: $BIN_NAME @ $LOCATION"
      htseq-count -f bam -r pos -s no -i ID -t CDS "$BAM" "$GFF_CLEAN" > "$COUNTS_DIR/$LOCATION/${BIN_NAME}_counts.txt"
    else
      echo "⚠️  Can't find the _clean.gff file for $BIN_NAME – skips it."
    fi
  done
}

#Run for both locations
run_htseq_counts location37
run_htseq_counts location39

