# A Dockerfile for performing the fastq-dump command,which is part of the NCBI SRA Toolkit

example command
```
docker run -v '/path/to/file/with/SequenceIDs.txt'/tmp cyverseuk/fastq-dump  
```
for command details see:

See [SRA Toolkit Documentation: fastq-dump](https://trace.ncbi.nlm.nih.gov/Traces/sra/sra.cgi?view=toolkit_doc&f=fastq-dump) for more details.

SequenceIDs.txt should include one sequence ID per line like so:
SRR636596
SRR636597
SRR636598
