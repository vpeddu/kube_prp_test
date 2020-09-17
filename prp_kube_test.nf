process One {  
    
    container 'quay.io/vpeddu/clomp_containers:latest'   
    
    input:

    output:
    file 'test1.txt' into oneOut

    script:
    """
    echo "asdlkfjalsdkfj" >> test1.txt
    """
}

process Two {    
    
    publishDir "$baseDir/data/" 
    container 'quay.io/vpeddu/clomp_containers:latest'   
    input:
    file 'test1.txt' from oneOut        

    output:
    file 'test2.txt' 

    script:
    """
    echo "2938579235" >> test1.txt 
    mv test1.txt test2.txt
    """
}
