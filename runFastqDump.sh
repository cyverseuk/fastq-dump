#!/bin/bash


echo "creating output dir"
mkdir SRA_download

SEQ_LIST=$1
mv $SEQ_LIST tmp
echo "moving $SEQ_LIST to tmp"


while read line;
do
#retrieve sequences
echo "retrieving $line from SRA"
fastq-dump $line --outdir SRA_download;
done < tmp/$SEQ_LIST

#-v "$(pwd)":/data -w /data
