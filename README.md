Project plan

Project goal:

In the paper I am basing this project on, the researchers studied the metabolic roles and pathways of different bacteria that grow in dead zones (areas with low to no oxygen). In this project, I am therefore going to perform a metagenome assembly with data from their research and compare gene expression of bacteria growing in hypoxic environments and low oxygen environments. Hypoxia occurs when the dissolved oxygen (DO) level is equal to or below 2 mg/l. To do this analysis, I am going to use a number of softwares to help me analyze the data. I am going to perform binning on the assembled metagenome and do a phylogenetic placement analysis to be able to tell what bacteria there were in the two environments. I am also going to do a gene expression analysis using annotation to determine which parts of the genome are actual genes and find out more about the function of the genes. Therefore, the goal of the project is to perform a metagenome assembly with a subset of the data the scientists used in the research and try to some extent recreate the results the researchers got in the study.  

Data used in the project: 

| Data | Sample       | DNA/RNA | Dissolved oxygen level (mg/l) | Tool     |
|------|-------------|---------|-------------------------------|----------|
| WGS  | SAMN05791315 | DNA     | High (4,12)                     | Illumina |
| WGS  | SAMN05791317 | DNA     | Low (0,4)                       | Illumina |
| WGS  | SAMN05791321 | RNA     | High (4,12)                     | Illumina |
| WGS  | SAMN05791323 | RNA     | Low (0,4)                       | Illumina |

Table 1. This table shows important parts of the metadata such as sample name, if the data is DNA or RNA sequences and what levels of dissolved oxygen the samples were acquired from. Hypoxia occurs when DO < 2 mg/l.

Analyses workflow: 

To perform this analysis, I will first check the quality of the reads with FastQC. Then I will trim the raw RNA data using trimmomatic, but not the raw DNA data since that has already been trimmed. After trimming the raw RNA data I will once more check the quality with FastQC. I will then perform the metagenomic assembly of the DNA with Megahit and evaluate the results with QUAST. Then, I will do binning of the assembly by using Metabat and evaluate the results with CheckM. During the evaluation of the binning results, I will also perform annotation with Prokka since my data comes from bacterial DNA. Afterwards, I plan to map the RNA reads to the bins by using the software BWA. When the mapping is done, I will do a read counting with HTseq. Finally, I plan to do a phylogenetic placement as well as an expression analysis using GTDB-Tk to find out what bacteria there were in the hypoxic vs non hypoxic environments and their gene expressions. See figure 1 for a workflow of the analysis. 

Some of these analyses will take several hours to perform, for example the metagenome assembly which is expected to take 6 hours. Therefore, I have made a time plan (see section Time plan, table 2) to keep track of deadlines and how much time I have/need for each step in the project. 

![image](https://github.com/user-attachments/assets/2e759c38-7486-4691-b40e-c469a4062a71)

Figure 1. Analyses workflow for the project. 

Time plan:

Since this project is going on for almost the whole course, I have made a time plan (see table 2) to keep track of deadlines and how long each step of the analysis is expected to take to make sure I don't miss any important deadlines and will be able to finsih the project in time. This table will continue to be updated throughout the course of the project when progress with the analysis and its different steps has been made. 

| Day  | Hours | Process                                    | Status     | Data Type        | Software          | Estimated time              |
|------|-------|-------------------------------------------|------------|------------------|-------------------|-----------------------------|
| 28/3 | 2     | Seminar                                   | Completed  |                  |                   | 2 h                         |
| 1/4  | 4     | Github workshop                          | Completed  |                  | Github            | 4 h                         |
| 3/4  | 7      | Project plan                             | Completed  |                  | Github            | 6 h                         |
| 7/4  | 3     | Quality check                            | Completed     | Illumina         | FastQC            | ~15 min                     |
| 7/4  | 2      | RNA reads preprocessing and post quality check |Completed        | Illumina         | Trimmomatic, FastQC | ~15 min/sample ~15 min  |
| 10/4  |       | Metagenome assembly                     | Ongoing           | Metagenomics     | Megahit           | ~6 h (2 cores)              |
| 11/4  |       | Evaluation of metagenome assembly       |            | Fasta            | QUAST             | ~45 min (2 cores)           |
| 25/4 |       | Binning                                  |            | Metagenomics     | Metabat           | < 30 min (2 cores)          |
| 28/4 |       | Bin quality evaluation and annotation   |            | Fasta, Bacteria  | CheckM, Prokka    | ~2 h (2 cores) ~1 h (2 cores) |
| 2/5  |       | RNA mapping                             |            | Bacterial RNA    | BWA               | ~4-6 h (2 cores)            |
| 14/5 |       | Read counting                           |            | Count features   | HTseq             | Variating                    |
| 15/5 |       | Phylogenetic placement                 |            | MAGs             | GTDB-Tk           | ~45 min (16 cores)          |
| 16/5 |       | Expression analyses                    |            | Comparison       | DESeq2            | A few minutes               |
| 23/5 |       | Wiki                                    |            |                  | Github            | 10 h                         |
| 28/5 |       | Project presentation                   |            |                  |                   | 10 h (15 min for presenting + questions) |

Table 2. Time plan of the project. 

Data management plan:

Since I will handle a lot of data during this project, I have made a data management plan (see figure 2). I will follow this plan when I sort my files that will be created during the course of the project. I will also name my files according to the folders and subfolders they are placed in. I also plan to keep track of how much storage I have left to utilize so I do not cross the limit. Since the files with the raw data are very large, I plan to create soft links to each of them as well as rename them so it is clear what data the files contain. 

![image](https://github.com/user-attachments/assets/7342b0fb-26f5-4aec-8142-fffcab7d5618)

Figure 2. Data management plan in tree form. 
