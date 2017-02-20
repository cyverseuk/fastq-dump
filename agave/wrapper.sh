#!/bin/bash


Seq_names="${input_1}"
#ADAPTERS="${adapters}"
fullfilename=$Seq_names
filename=$(basename "$fullfilename")
echo $filename


#mv $filename Seq_names.txt


cp fastq_dump_submit.htc condorsubmit.htc
echo transfer_input_files = $Seq_names >> condorsubmit.htc
echo arguments = $filename  >> condorsubmit.htc

#H5COMMA=`echo ${h5} | sed -e 's/ /,/g'`
#echo transfer_input_files = ${adapters},$H5COMMA >> sratools_submit.htc
echo queue >> condorsubmit.htc

jobid=`condor_submit condorsubmit.htc`
jobid=`echo $jobid | sed -e 's/Sub.*uster //'`
jobid=`echo $jobid | sed -e 's/\.//'`

#echo $jobid

#echo going to monitor job $jobid
condor_tail -f $jobid

exit 0
