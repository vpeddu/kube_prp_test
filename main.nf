FASTQ_ch = file("${params.fastq}")
DATABASE_ch = file("${params.krakendb}")

process Kraken {  
    
    container 'tbattaglia/kraken2'   
    
    publishDir "KrakenOut/"

    input:
        file krakendb from DATABASE_ch
        file fastq from FASTQ_ch

    output:
        file "classified.fastq"
        file "unclassified.fastq"
        file "kraken_report.tsv"

    cpus 2
    memory 7.Gb 

    script:
    """
    #!/bin/bash

    echo "kraken running"
    kraken2 --db ${krakendb} --threads ${task.cpus} ${fastq} --quick \
    --classified-out classified.fastq --unclassified-out unclassified.fastq \
    --gzip-compressed --report kraken_report.tsv --use-names

    echo "kraken finished. Logging ls"
    ls -latr


    """
}