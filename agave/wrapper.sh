#!/bin/bash


Seq_names="${input_1}"


#mv $filename Seq_names.txt


cp fastq_dump_submit.htc condorsubmit.htc
echo transfer_input_files = ${input_1} >> condorsubmit.htc
echo arguments = ${input_1}  >> condorsubmit.htc


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
