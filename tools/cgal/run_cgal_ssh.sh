#!/bin/bash
# 
source hpccore-5
source bowtie2-2.2.5
source samtools-1.0
source jdk-1.7.0_25
source CGAL-0.9.6 
declare -xr SOURCEDIR="$(dirname $BASH_SOURCE)/.."
source $SOURCEDIR/ssh_header.sh
# PREFIX - Name of strain to assemble
# READS1 - First set of paired end reads, relative to $LOCAL_READSDIR
# READS2 - Second set of paired end reads, relative to $LOCAL_READSDIR
# TOOL_TAG - Tag to indicate the output from this tool
# PARAMETERS - Data used to paramatirse this tool
#
# WORKDIR - Directory in which to put tempory work files
# READSDIR - Directory where paired end reads are located
#-------------------------- Assembly specific code here --------------------
echo BOWTIE2 ssh: about to run ssh bowtie2 on $TEMPLATE

declare -r SAMFILE=$SSH_RESULTDIR/${PRFIX_STUB}_BOW2.sam

cd  $WORKDIR
echo about to run bowtie2convert
echo "bowtie2convert $SAMFILE 600"
bowtie2convert $SAMFILE 600
echo
#IFS=' ' read -ra bids <<< "${BSUBIDS[$i]}"
echo "align $TEMPLATE.fasta 1000 12"
echo "align $TEMPLATE $PARAMETERS"
#align $TEMPLATE 1000 12
align "$TEMPLATE" $PARAMETERS
echo "cgal $TEMPLATE.fasta"
echo
cgal $TEMPLATE
echo "finished cgal"
#Give location of result files
METRICS_CSV=$WORKDIR/out.txt

#-------------------------- Assembly specific code here --------------------

cp $METRICS_CSV $SSH_RESULTDIR/m_${PRFIX_STUB}_${TOOL_TAG}

#cp $CONTIGS $SSH_RESULTDIR/${ASSEMBLY_TAG}c${PREFIX}i.fasta
#cp $SCAFFOLDS $SSH_RESULTDIR/${ASSEMBLY_TAG}s${PREFIX}i.fasta
echo `basename "$0"`: FINISHED!! FINISHED!!
