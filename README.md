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

17 directories, 2 files
