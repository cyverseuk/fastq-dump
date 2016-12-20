# A Dockerfile for performing the fastq-dump command,which is part of the NCBI SRA Toolkit

example command
``` 
docker run cyverseuk/sra-toolkit <path/to/doc/with/SRR-identifiers.txt>  
```
example command for sra-tool to retrieve the sequence from SRR3130488 (8 MB) in .sra format.

```
docker run cyverseuk/sra-toolkit prefetch SRR3130448
```

for commands see:

See [SRA Toolkit Documentation: fastq-dump](https://trace.ncbi.nlm.nih.gov/Traces/sra/sra.cgi?view=toolkit_doc&f=fastq-dump) for more details.
