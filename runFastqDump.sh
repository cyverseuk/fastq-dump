#!/bin/bash


echo "creating output dir"
mkdir SRA_download

cp ../Seq_names.txt .

while read line;
do
#retrieve sequences
echo "retrieving $line from SRA"
fastq-dump $line --outdir SRA_download;
done < tmp/Seq_names.txt

#-v "$(pwd)":/data -w /data
