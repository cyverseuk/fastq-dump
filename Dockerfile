# Docker container for SRAToolKit developed by NCBI Genbank/SRA team.
# Toolkit VERSION 2.8.0

# Pull base image.
FROM ubuntu:14.04.4

# :)
MAINTAINER Tazro Inutano Ohta, inutano@gmail.com

# clone repo
WORKDIR /src
ENV VERSION 2.8.0

RUN  apt update
RUN  apt install -y wget
RUN  wget "http://ftp-trace.ncbi.nlm.nih.gov/sra/sdk/${VERSION}/sratoolkit.${VERSION}-ubuntu64.tar.gz"
RUN  tar zxfv sratoolkit.${VERSION}-ubuntu64.tar.gz
RUN  cp -r sratoolkit.${VERSION}-ubuntu64/bin/* /usr/bin


COPY runFastqDump.sh /tmp/runFastqDump.sh
RUN /tmp/runFastqDump.sh


# Default command
WORKDIR /data
CMD ["bash"]
