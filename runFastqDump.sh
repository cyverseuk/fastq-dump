#!/bin/bash

ls
echo "creating output dir"
mkdir SRA_download
cd SRA_download
cp $1 .

while read line
##retrieve sequences
do echo "retrieving $line from SRA"
fastq-dump $line  --outdir .
done <`basename $1`

#-v "$(pwd)":/data -w /data
