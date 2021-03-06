#!/bin/bash
# 
source hpccore-5
source quast-3.1
QUASTDIR=/nbi/software/testing/quast/3.1/x86_64/bin
declare -r SOURCEDIR="$1"
source $SOURCEDIR/tools/ssh_header.sh
# PREFIX - Name of strain to assemble
# READS1 - First set of paired end reads, relative to $LOCAL_READSDIR
# READS2 - Second set of paired end reads, relative to $LOCAL_READSDIR
# TOOL_TAG - Tag to indicate the output from this tool
# PARAMETERS - Data used to paramatirse this tool
#
# WORKDIR - Directory in which to put tempory work files
# READSDIR - Directory where paired end reads are located
#-------------------------- Assembly specific code here --------------------
debug_msg  ${LINENO}  "QUAST ssh: about to run ssh quast on $PREFIX"

debug_msg  ${LINENO}  "template is $TEMPLATE"
debug_msg  ${LINENO}  "$QUASTDIR/quast.py  --eukaryote  --scaffolds  -o $WORKDIR  $f"
debug_msg  ${LINENO}  "now send the quest command for real"

$QUASTDIR/quast.py \
  --eukaryote \
  -o $WORKDIR \
  $TEMPLATE

#Give location of result files
METRICS=$WORKDIR/transposed_report.tsv

#-------------------------- Assembly specific code here --------------------
source $SOURCEDIR/tools/ssh_footer.sh

#WORKDIR=/nbi/group-data/ifs/NBI/Research-Groups/Jo-Dicks/Piers/assemblies/test/NCYC388/rNCYC388i
#TEMPLATE=/nbi/group-data/ifs/NBI/Research-Groups/Jo-Dicks/Piers/assemblies/test/NCYC388/rNCYC388i.fasta
#bsub $QUASTDIR/quast.py   --eukaryote   --scaffolds   -o $WORKDIR   $TEMPLATE