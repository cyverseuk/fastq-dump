#!/bin/bash

echo "creating output dir"
mkdir SRA_download
ls
pwd
cd /tmp/
echo "creating output dir2"
ls
pwd
while read line
##retrieve sequences
do echo "retrieving $line from SRA"
fastq-dump.2.8.0 $line  --outdir ../SRA_download/
done < $1

#-v "$(pwd)":/data -w /data
