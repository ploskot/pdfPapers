#!/bin/bash
# example calls texttoinfo

#pdfastext -c1 -t1 -m1 -i sample1.pdf

i=1

fin=./output/sample${i}.out2
fout=$fin.dat

echo fin=$fin
texttoinfo -bow -w 3 -ge 15 -sw en-stopwords -ex '.*?.*' -o array $fin



exit 0


# bag of words
#bow $fin -w 3 -sw en-stopwords -ex '.*?.*' -o clean
#bow $fin -w 3 -sw en-stopwords -ow "filter noise circuit" -20

# aspell
# cat $fin | aspell --master=./en-custom.dict list --ignore 3 \
#	--ignore-case --ignore-accents --sug-mode normal
# cat $fin | aspell --master=$aspell_dict list -W 3 | sort | uniq -c 

exit 0

xx="$(getnwords $fin -p "{filter" -n -2,+2 -sw en-stopwords | cut -d, -f3)"
n="$(wc -l <<< "$xx")"
i=0
while IFS= read -r l1; do
    while IFS= read -r l2; do
	exprdist "$l1" "$l2" >> "$fout"
    done <<< "$xx"
    printf "\r %d/%d   " $(( ++i )) $n
done <<< "$xx"

cat $fout | sed 's/^\s*//' | sort | uniq -c | sort -nrk1 | head -20

