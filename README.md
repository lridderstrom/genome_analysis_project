Project plan

Project goal:

The aim of the project is to perform a metagenome assembly and find out what bacteria there are in two different environments and their gene expression.

Table of data:

This table shows the data

(dissolved oxygen [DO] below 2 mg/l ~ 62.5 mikro mol/kg)

| Data | Sample       | DNA/RNA | Dissolved oxygen level (mg/l) | Tool     |
|------|-------------|---------|-------------------------------|----------|
| WGS  | SAMN05791315 | DNA     | High 4,12                     | Illumina |
| WGS  | SAMN05791316 | DNA     | low 0,33                      | Illumina |
| WGS  | SAMN05791317 | DNA     | low 0,4                       | Illumina |
| WGS  | SAMN05791318 | DNA     | high 2,64                     | Illumina |
| WGS  | SAMN05791319 | DNA     | low 0,07                      | Illumina |
| WGS  | SAMN05791320 | DNA     | low 0,31                      | Illumina |
| WGS  | SAMN05791321 | RNA     | high 4,12                     | Illumina |
| WGS  | SAMN05791322 | RNA     | low 0,33                      | Illumina |
| WGS  | SAMN05791323 | RNA     | low 0,4                       | Illumina |
| WGS  | SAMN05791324 | RNA     | high 2,64                     | Illumina |
| WGS  | SAMN05791325 | RNA     | low 0,07                      | Illumina |
| WGS  | SAMN05791326 | RNA     | low 0,31                      | Illumina |




● What type of analyses will you perform in order to answer these questions? And in which order? Which softwares will you use? Are there any time bottlenecks? If so, can you identify any analyses that will require longer times?

Reads preprocessing: trimming + quality check (before and after). ● Metagenome assembly. ● Binning. ● Quality check of assembly and bins. ● Basic phylogenetic placement of bins (Taxonomic ID). ● Functional annotation. ● Analysis of activity (expression level) of different bins.

![image](https://github.com/user-attachments/assets/2e759c38-7486-4691-b40e-c469a4062a71)


● What is the time frame for your project? Can you define some time checkpoints for when you should have finished certain analyses? When do you need to have finished running all the softwares so you can start to analyse the data?

| Day  | Hours | Process                                    | Status     | Data Type        | Software          | Estimated time              |
|------|-------|-------------------------------------------|------------|------------------|-------------------|-----------------------------|
| 28/3 | 2     | Seminar                                   | Completed  |                  |                   | 2 h                         |
| 1/4  | 4     | Github workshop                          | Completed  |                  | Github            | 4 h                         |
| 3/4  |       | Project plan                             | Ongoing    |                  | Github            | 6 h                         |
| 4/4  |       | Quality check                            |            | Illumina         | FastQC            | ~15 min                     |
| 4/4  |       | RNA reads preprocessing and post quality check |        | Illumina         | Trimmomatic, FastQC | ~15 min/sample ~15 min  |
| 7/4  |       | Metagenome assembly                     |            | Metagenomics     | Megahit           | ~6 h (2 cores)              |
| 8/4  |       | Evaluation of metagenome assembly       |            | Fasta            | QUAST             | ~45 min (2 cores)           |
| 25/4 |       | Binning                                  |            | Metagenomics     | Metabat           | < 30 min (2 cores)          |
| 28/4 |       | Bin quality evaluation and annotation   |            | Fasta, Bacteria  | CheckM, Prokka    | ~2 h (2 cores) ~1 h (2 cores) |
| 2/5  |       | RNA mapping                             |            | Bacterial RNA    | BWA               | ~4-6 h (2 cores)            |
| 14/5 |       | Read counting                           |            | Count features   | HTseq             | Variating                    |
| 15/5 |       | Phylogenetic placement                 |            | MAGs             | GTDB-Tk           | ~45 min (16 cores)          |
| 16/5 |       | Expression analyses                    |            | Comparison       | DESeq2            | A few minutes               |
| 23/5 |       | Wiki                                    |            |                  | Github            | 10 h                         |
| 28/5 |       | Project presentation                   |            |                  |                   | 10 h (15 min for presenting + questions) |


● What types of data will you be handling? How much space do you need in order to store the data? (You might not know that in advance, but pay attention to this as you work and manage your available space!)

● How will you organise your data? (see “Project Organization”)

![image](https://github.com/user-attachments/assets/7342b0fb-26f5-4aec-8142-fffcab7d5618)


17 directories, 2 files
