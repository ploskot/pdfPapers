!/bin/bash
############################################################################
##                                                                        ##
##  Tests commands defined in textblocks utility                          ##
##                                                                        ## 
##  Developed and tested with GNU bash version 5.0.17                     ##
##                                                                        ##
############################################################################

source "textblocks"

trap "echo :exiting;exit 1" SIGINT SIGTERM

this="${0/#*\/}"

# copy blocks from one file to specific location in another file
# if source and destination are same, copied blocks are labeled as Cblocks
# Usage: copyblocks sourcefile destinationfile {blocks}
#        after {label}|before {label}|start|end
#
#copyblocks $fin $fout "1.1-1.2" before 1.611

# delete blocks in given file
# Usage: deleteblocks filename {blocks}
#
#deleteblocks "$fout" "1.4-1.5"

# remove block labels and extra white spaces and empty lines, break blocks 
# into sentences or words, and add comma-separated meta information
# Usage:   cleanblocks inputfile outputfile [OPTIONS]
#          cleanblocks inputfile inputfile [OPTIONS] (for -inplace)
# OPTIONS: as {chars:str} append string {str} to every character in {chars}
#          rc {chars:str} replace every character in {chars} with {str}
#          rs {str1:str2} replace all occurrences of {str1} with {str2}
#          tr {tropts}    filter text with tr {tropts} command
#          addmeta above|below|before|after append metainfo
#          all { and } in OPTIONS are replaced with "
#cleanblocks $fin $fout  as "!.?!:\\n" rc "aes:XXX" tr "nc" "NC" \
#	    rs \"  \\+: \" rs \"^ \\+:\" r    addmeta above
#cleanblocks $fin $fout  rs \"\\\([a-z]\\\)- \\+\\\([a-z]\\\):\\1\\2\" as "!.?!:\\n" rs \"  \\+: \" rs \"^ \\+:\"    addmeta before
# cleanblocks $fin $fout addmeta above


# sort blocks in file from starting block to ending block in ascending or
# descending order
# Usage: sortblocks filename from {block1} to {block2} [ascend(default)|descend]
#    or: sortblocks filename all [ascend(default)|descend]
#
#sortblocks "$fout" all ascend

# move multiple blocks within one file to specific location
# Usage: moveblocks filename  [ascopy] {blocks}
#        after {label}|before {label}|start|end
#
#moveblocks "$fout" "1.2-1.3" end

# merge multiple blocks into one block with existing (to) label, and then
# possibly change this label to (as) label; attempt to overwrite existing
# block not in {blocks} causes error
# Usage: mergeblocks filename {blocks} to {label} [as {label}]
#
#mergeblocks "$fout" "1.2 1.4 1.6" to "1.6" 

# renumber selected blocks
# Usage: renumberblocks filename change {blocks1} to {blocks2}
#        renumberblocks filename from {block} [as {block}] to {block} [by {val}]
#        renumberblocks filename setpage {page} from {block} to {block}
#
#renumberblocks "$fout"  setpage 55 from 1.16 to 1.4

# filter contents of selected blocks with given function
# Usage: filterblocks filename {blocks} {function} arg|pipe stdout|inplace
#        function call via pipe:    echo "block-contents" | function
#        function call as argument: function $(echo "block-contents")
#
#testarg() { echo "${1^^}"; }
#testpipe="tr [:lower:] [:upper:]"
#filterblocks test1.out 1.4-2 with "$testpipe" as pipe to inplace
#filterblocks test1.out 1.4-2 with testarg as arg to inplace

# add a string to selected blocks before or after the text
# Usage: addtexttoblocks filename {string} above|below|before|after {blocks}
# addtexttoblocks test1.out "ADD THIS STRING." after 1.4-5



