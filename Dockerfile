# Docker container for the fastq-dump command which is part of the SRAToolKit developed by NCBI Genbank/SRA team.
# Toolkit VERSION 2.8.0

# Pull base image.
FROM ubuntu:14.04.4

MAINTAINER Annemarie Eckes, Annemarie.Eckes@earlham.ac.uk

# clone repo
WORKDIR .
ENV VERSION 2.8.0

RUN  apt update
RUN  apt install -y wget
RUN  wget "http://ftp-trace.ncbi.nlm.nih.gov/sra/sdk/${VERSION}/sratoolkit.${VERSION}-ubuntu64.tar.gz"
RUN  tar zxfv sratoolkit.${VERSION}-ubuntu64.tar.gz
RUN  cp -r sratoolkit.${VERSION}-ubuntu64/bin/* /usr/bin

#run fastq-dump specific script
COPY runFastqDump.sh /tmp/runFastqDump.sh
RUN /tmp/runFastqDump.sh


# Default command
WORKDIR .
CMD ["bash"]
