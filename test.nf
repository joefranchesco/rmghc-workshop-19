#!/usr/bin/env nextflow
params.name             = "RNA-seq"
params.reads            = "/data/fastq/*{*_R1,*_R2}.fastq.gz"
params.email		= "joseph.cardiello@colorado.edu"


log.info "RNA-seq Pipeline"
log.info "====================================="
log.info "name         : ${params.name}"
log.info "reads        : ${params.reads}"
log.info "\n"
log.info "email	       : ${params.email}"

reads = Channel.fromFilePairs(params.reads, size: -1)

process view_reads {

 publishDir "results"

 input:
 set val(sample_id), file(read_files) from reads

 output:
 file "*.txt"

 script:

 """
zcat ${read_files[[1]]} | head > ${sample_id}_reads.txt

# commend: here the 'read_files" or sample_ids are being pulled from the defined input above, could have named them anything and just have to copy
# those names here bellow
# to write commands above in the nextflow region, use // instead of a hashtag


 """
}
