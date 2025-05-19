#!/bin/bash -l
#SBATCH -A uppmax2025-3-3
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 00:10:00
#SBATCH -J summarize_counts
#SBATCH --mail-type=ALL
#SBATCH --mail-user=linnea.ridderstrom.5181@student.uu.se
#SBATCH --output=summarize_counts_%j.out

#Pathways
COUNTS_DIR=/home/liri5181/genome_analysis_project/analyses/rna/03_read_counting
OUT_FILE=$COUNTS_DIR/expression_summary.tsv

#Write header for table
echo -e "Bin\tLocation\tTotal_counts" > "$OUT_FILE"

#Loop over locations
for LOCATION in location37 location39; do
  for FILE in $COUNTS_DIR/$LOCATION/*_counts.txt; do
    BIN=$(basename "$FILE" _counts.txt)
    TOTAL=$(grep -v '^__' "$FILE" | awk '{sum+=$2} END {print sum}')
    echo -e "${BIN}\t${LOCATION}\t${TOTAL}" >> "$OUT_FILE"
  done
done

