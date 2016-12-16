# Docker container for SRA-toolkit developed by NCBI Genbank/SRA team.
# update to toolkit VERSION 2.8.0

# Pull base image.
FROM ubuntu:14.04.4


MAINTAINER Annemarie Eckes Annemarie.Eckes@earlham.ac.uk
#Dockerfile partially taken from Tazro Inutano Ohta, inutano@gmail.com, and expanded.

# clone repo
WORKDIR /tmp
ENV VERSION 2.8.0

RUN  apt update
RUN  apt install -y wget
RUN  wget "http://ftp-trace.ncbi.nlm.nih.gov/sra/sdk/${VERSION}/sratoolkit.${VERSION}-ubuntu64.tar.gz"
RUN  tar zxfv sratoolkit.${VERSION}-ubuntu64.tar.gz
RUN  cp -r sratoolkit.${VERSION}-ubuntu64/bin/* /usr/bin


# COPY runFastqDump.sh /tmp/runFastqDump.sh
# RUN /tmp/runFastqDump.sh


# Default command
WORKDIR /tmp
CMD ["bash"]
