#!/bin/bash -l
#sbatch -N 1 -n 32 --mem 30gb --out logs/wgsim.%a.log --time 04:00:00

module load samtools

genome=combined_sim_genome/combined_chr4.fasta
mkdir -p sim_fastq

coverage=11

wgsim -1 300 -2 300 -r 0 -R 0 -X 0 -e 0 -d  $coverage $genome sim_fastq/sim_chr4_1.fastq sim_fastq/sim_chr4_2.fastq
