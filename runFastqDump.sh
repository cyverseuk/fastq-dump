#!/bin/bash


echo "creating output dir"
mkdir SRA_download
cd SRA_download
cp ../Seq_names.txt .

while read line;
##retrieve sequences
do echo "retrieving $line from SRA"
fastq-dump $line  --outdir .;
done <Seq_names.txt

#-v "$(pwd)":/data -w /data
