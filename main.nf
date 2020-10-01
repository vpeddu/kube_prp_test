
process Testing {  
    //pod secret: "prp-s3-credentials/credentials", mountPath: "/root/.aws/credentials"
    container 'tbattaglia/kraken2'   
    pod = [secret: "prp-s3-credentials", mountPath: "/root/.aws"]
    publishDir "s3://bmebootcamp/vpeddu/ahhhhhhhhhhhhhh/"

    // input:
    //     file krakendb from DATABASE_ch
    //     file fastq from FASTQ_ch

     output:
         file "credentials.txt"

    cpus 2
    memory 4.Gb 

    script:
    """
    #!/bin/bash

    cat /root/.aws/credentials > credentials.txt


    """
}
