
process Testing {  
    pod secret: "prp-s3-credentials/credentials", mountPath: "/root/.aws/credentials"
    container 'tbattaglia/kraken2'   
    
    publishDir "KrakenOut/"

    // input:
    //     file krakendb from DATABASE_ch
    //     file fastq from FASTQ_ch

    // output:
    //     file "classified.fastq"
    //     file "unclassified.fastq"
    //     file "kraken_report.tsv"

    cpus 2
    memory 7.Gb 

    script:
    """
    #!/bin/bash

    cat ~/.aws/credentials


    """
}

// FASTQ_ch = file("${params.fastq}")
// DATABASE_ch = file("${params.krakendb}")

// FASTA_ch = Channel
//             .fromPath("${params.reference_genomes}**.fasta")
//             .map { file -> tuple(file.baseName, file) }


// process Kraken {  
//     pod secret: "prp-s3-credentials/credentials", mountPath: "/root/.aws/credentials"
//     container 'tbattaglia/kraken2'   
    
//     publishDir "KrakenOut/"

//     input:
//         file krakendb from DATABASE_ch
//         file fastq from FASTQ_ch

//     output:
//         file "classified.fastq"
//         file "unclassified.fastq"
//         file "kraken_report.tsv"

//     cpus 2
//     memory 7.Gb 

//     script:
//     """
//     #!/bin/bash

//     echo "kraken running"
//     kraken2 --db ${krakendb} --threads ${task.cpus} ${fastq} --quick \
//     --classified-out classified.fastq --unclassified-out unclassified.fastq \
//     --gzip-compressed --report kraken_report.tsv --use-names

//     echo "kraken finished. Logging ls"
//     ls -latr


//     """
// }

// process Minimap2 {  
//     pod secret: "prp-s3-credentials/credentials", mountPath: "/root/.aws/credentials"
//     container 'biocontainers/minimap2:v2.15dfsg-1-deb_cv1'   
    
//     publishDir "Minimap2Out/"

//     input:
//         tuple val(base), file(reference_fasta) from FASTA_ch
//         file fastq from FASTQ_ch

//     output: 
//         file "${base}.sam"
//     cpus 2
//     memory 4.Gb 

//     script:
//     """
//     #!/bin/bash

//     echo "file ${base}"

//     minimap2 -t ${task.cpus} -x map-pb -a ${reference_fasta} ${fastq} > ${base}.sam

//     """
// }