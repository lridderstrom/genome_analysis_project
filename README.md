Project plan

Project goal:

The aim of the project is to perform a metagenome assembly and find out what bacteria there are in two different environments and their gene expression.

Table of data:

This table shows the data

(dissolved oxygen [DO] below 2 mg/l ~ 62.5 mikro mol/kg)

| data | sample       | DNA/RNA | dissolved oxygen level (mg/l) | tool     |
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

● What is the time frame for your project? Can you define some time checkpoints for when you should have finished certain analyses? When do you need to have finished running all the softwares so you can start to analyse the data?

presentation 28 May
● What types of data will you be handling? How much space do you need in order to store the data? (You might not know that in advance, but pay attention to this as you work and manage your available space!)

● How will you organise your data? (see “Project Organization”)


.
├── analyses
│   ├── dna
│   │ 
├── 01_preprocessing
│   │   ├── 02_metagenome_assembly
│   │   ├── 03_binning
│   │   ├── 04_annotation
│   │   └── 05_phylogenetic_placement
│   └── rna
│       ├── 01_preprocessing_rna
│       ├── 02_mapping
│       ├── 03_read_counting
│       └── 04_expression_analysis
├── code
├── data
│   ├── metadata
│   ├── raw_data
│   └── trimmed_data
├── README.md
└── SraRunTable.csv


- analyses
  - dna
    - 01_preprocessing
      - fastqc_trim
    - 02_metagenome_assembly
    - 03_binning
    - 04_annotation
    - 05_phylogenetic_placement
  - rna
    - 01_preprocessing_rna
      - fastqc_raw
      - fastqc_trim
      - trimming_software
    - 02_mapping
    - 03_read_counting
    - 04_expression_analysis
- code
- data
  - metadata
  - raw_data
  - trimmed_data
- README.md


17 directories, 2 files
