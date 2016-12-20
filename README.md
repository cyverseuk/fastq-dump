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

See [github.com/ncbi/sra-tools/wiki](https://github.com/ncbi/sra-tools/wiki/) for more details.
