# Creating Simulated Genome and Short Reads for TE finding

Was having trouble with finding Ping using short read data

Want to create a small genome that has mPing, Ping, unique Ping,
unique Pong, and Pong sequence inserted in different areas.

After creating the genome we want to create simulated short read
data that we can use for TE finding tools.



## Code Used

The following code was used to grab Chr4 from reference genome, add TE insertions stepwise, and generate short reads.
All code was ran in the head directory.

### Get Chr4

Chr4 was grabbed from the NB genome
seqkit grep -i -r -n -p '^>NC_029259\.1 Oryza sativa Japonica Group cultivar Nipponbare chromosome 4, IRGSP-1\.0$' Nipponbare_IRGSP_1.0.fa -o Nipponbare_Chr4.fa

### Add TE insertions

To create the simulated genome a python script was used found here:
https://github.com/stajichlab/Dynamic_rice_publications/tree/master/rice_3k_mPing_scripts/Copy_numbers_characterization/RelocaTE2_mPing/Simulation

Command to run the above python script to add mPing insertions:
python scripts/Simulation_TE_Insertion.py --repeat mping.fa --genome Nipponbare_Chr4.fa  --te mPing  --chr Chr4 --number 300

The output fasta file from the above script was used to then add ping, unique_ping, unique_pong, and pong to Chr4:
python scripts/Simulation_TE_Insertion.py --repeat $Other_Element --genome Nipponbare_Chr4.fa  --te $Element_Name  --chr Chr4 --number $Num_Added

### Generate Short Reads

Wgsim was ran using this script:
wgsim_sim_reads.sh


## Simulated Genome Characteristics

Genome was created only using Chr4 from Nipponbare

TEs Added:
mPing = 300
Ping = 4
Pong = 2
Unique_Ping = 4
Unique_Pong = 2

Unique ping and pong were created by trimming both sequences so only the unique internal sequence is kept.

## Input

The reference genome (GCF_001433935.1_IRGSP-1.0_genomic.fna) was renamed as a symlink to Nipponbare_IRGSP_1.0.

The genome and TE sequences used can be found here:
/rhome/nmath020/wessler_bigdata/rice/really_finding-ping/make_simulated_genome/make_simulation/input

## Intermediate Files

These were created because each of the TE sequences were added in a stepwise manner which created individual 
fasta and gff files at each step.

Intermediate files can be found here:
/rhome/nmath020/wessler_bigdata/rice/really_finding-ping/make_simulated_genome/make_simulation/intermediate_data





