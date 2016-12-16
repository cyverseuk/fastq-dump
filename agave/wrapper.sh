#!/bin/bash


INPUT_1="${input_1}"
#ADAPTERS="${adapters}"

#GSIZE="${genomesize}"
#RCUTOFF="${readcutoff}"

if [[ -n $GSIZE ]]; then
    GSIZE="-g $GSIZE"
fi

cp lib/templatesubmit.htc lib/condorsubmit.htc
echo arguments = $INPUT_1 >> sratools_submit.htc
#H5COMMA=`echo ${h5} | sed -e 's/ /,/g'`
#echo transfer_input_files = ${adapters},$H5COMMA >> sratools_submit.htc
echo queue >> sratools_submit.htc

jobid=`condor_submit sratools_submit.htc`
jobid=`echo $jobid | sed -e 's/Sub.*uster //'`
jobid=`echo $jobid | sed -e 's/\.//'`

#echo $jobid

#echo going to monitor job $jobid
condor_tail -f $jobid

exit 0