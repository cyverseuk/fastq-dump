#!/bin/bash


mkdir SRA_download

while read line;
do
#retrieve sequences
fastq-dump $line --outdir /SRA_download;
done< Seq_names.txt

-v "$(pwd)":/data -w /data
