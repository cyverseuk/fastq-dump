# A Dockerfile for performing the fastq-dump command,which is part of the NCBI SRA Toolkit

example command
```
docker run -v '</path/to/file/with/filenamewithSeqIDs.txt>':/tmp cyverseuk/fastq-dump  <filenamewithSeqIDs.txt>
```
for command details see:

See [SRA Toolkit Documentation: fastq-dump](https://trace.ncbi.nlm.nih.gov/Traces/sra/sra.cgi?view=toolkit_doc&f=fastq-dump) for more details.

filenamewithSeqIDs.txt should include one sequence ID per line like so:  
SRR636596  
SRR636597  
SRR636598  


*This Docker Image is also used in context with the AGAVE API and CyVerseUK, so that the output can be integrated into further CyVerse workflows*

#### User Instructions when using with CyVerse
You don't need to pull this image, Condor will do this in the background for you.
You need to have a [CyVerse](https://user.cyverse.org/) and a [BIP](https://bip.earlham.ac.uk/) account, downloaded the [cyverse-sdk client](https://github.com/cyverse/cyverse-sdk) (optional, but makes querying easier) and you must have created a RunApp.json, containing the following minimal information:


        {
                "name"    : "fastq-dump",
                "appId"   : "fastq-dump-0.0.1",
                "archive" : "true",
                "inputs": {
                "input_1"   : "agave://data.iplantcollaborative.org/<your_home_folder/path/to/filenamewithSeqIDs.txt>"
              }
            }

Please not that other input_locations such as web-urls are possible.


_Optional:_ you can include an output location, which is different from the default CyVerseUK-Storage system.

    "archiveSystem": "data.iplantcollaborative.org",

Change to this system will make the output available for further tools and workflows in the CyVerse US and the Discovery Environment, which is currently not directly hooked-up to the CyVerseUK system. This is likely to be changed in the future, and no DE-specific archiveSystem specifications need to be mentioned in the RunApp.json.

_Note:_ For big jobs, you need to allocate more memory. Currently, this app runs on default parameters. You do this by adding more attributes to the job submission json. A list of all attributes is in table 1, it is taken from the AGAVE API development website [job-submissions]http://developer.agaveapi.co/#job-submission).

<table>
    <thead>
        <tr>
            <th>Name</th>
            <th>Value(s)</th>
            <th>Description</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td>name</td>
            <td>string</td>
            <td>Descriptive name of the job. This will be slugified and used as one component of directory names in certain situations.</td>
        </tr>
        <tr>
            <td>appId</td>
            <td>string</td>
            <td>The unique name of the application being run by this job. This must be a valid application that the calling user has permission to run.</td>
        </tr>
        <tr>
            <td>batchQueue</td>
            <td>string</td>
            <td>The batch queue on the execution system to which this job is submitted. Defaults to the app&rsquo;s defaultQueue property if specified. Otherwise a best-fit algorithm is used to match the job parameters to a queue on the execution system with sufficient capabilities to run the job.</td>
        </tr>
        <tr>
            <td>nodeCount</td>
            <td>integer</td>
            <td>The number of nodes to use when running this job. Defaults to the app&rsquo;s defaultNodes property or 1 if no default is specified.</td>
        </tr>
        <tr>
            <td>processorsPerNode</td>
            <td>integer</td>
            <td>The number of processors this application should utilize while running. Defaults to the app&rsquo;s defaultProcessorsPerNode property or 1 if no default is specified. If the application is not of executionType PARALLEL, this should be 1.</td>
        </tr>
        <tr>
            <td>memoryPerNode</td>
            <td>string</td>
            <td>The maximum amount of memory needed per node for this application to run given in ####.#[E|P|T|G]B format. Defaults to the app&rsquo;s defaultMemoryPerNode property if it exists. GB are assumed if no magnitude is specified.</td>
        </tr>
        <tr>
            <td>maxRunTime</td>
            <td>string</td>
            <td>The estimated compute time needed for this application to complete given in hh:mm:ss format. This value must be less than or equal to the max run time of the queue to which this job is assigned. </td>
        </tr>
        <tr>
            <td>notifications*</td>
            <td>JSON array</td>
            <td>An array of one or more JSON objects describing an event and url which the service will POST to when the given event occurs. For more on Notifications, see the section on webhooks below.</td>
        </tr>
        <tr>
            <td>archive*</td>
            <td>boolean</td>
            <td>Whether the output from this job should be archived. If true, all new files created by this application&rsquo;s execution will be archived to the archivePath in the user&rsquo;s default storage system.</td>
        </tr>
        <tr>
            <td>archiveSystem*</td>
            <td>string</td>
            <td>System to which the job output should be archived. Defaults to the user&rsquo;s default storage system if not specified.</td>
        </tr>
        <tr>
            <td>archivePath*</td>
            <td>string</td>
            <td>Location where the job output should be archived. A relative path or absolute path may be specified. If not specified, a unique folder will be created in the user&rsquo;s home directory of the archiveSystem at &lsquo;archive/jobs/job-$JOB_ID&rsquo;</td>
        </tr>
    </tbody>
</table>

<p class="table-caption">Table 1. The optional and required attributes common to all job submissions. Optional fields are marked with an astericks.</p>
