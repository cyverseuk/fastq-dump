#!/bin/bash

echo "creating output dir"
mkdir SRA_download

cd /tmp/

while read line
##retrieve sequences
do echo "retrieving $line from SRA"
fastq-dump.2.8.0 $line  --outdir ../SRA_download/
done < $1

#-v "$(pwd)":/data -w /data
