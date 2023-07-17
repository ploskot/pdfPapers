#!/bin/bash
# LQi 25.10.2020
# testing


s1="us compare filter estimate"
s2="ensemble Poisson filter optimally"

exprdist() {
    local s1e="$(printf "%s\n" $1 | sed '/^\s*$/d')"
    local s2e="$(printf "%s\n" $2 | sed '/^\s*$/d')"
    n1="$(wc -l <<< "$s1e")"
    s2pad="$(echo "$s1e" | sed 's/^.*$/ /')"
    s2e="$(echo -e "$s2pad" "\n$s2e\n" "$s2pad")"
    n2="$(wc -l <<< "$s2e")"

    for (( i=2; i<=$((n2-n1)); i++ )); do
	c=0;c0=0;tt=   
	while IFS= read -r l; do
	    IFS="," read t1 t2 <<< "$l"
	    if [[ "$t1" == "$t2" ]]; then
		tt="$tt $t1"
		(( c++ ))
		c1="$(comm -12 <(fold -w1 <<< "$t1" | sort -u) \
	       	      <(fold   -w1 <<< "$t2" | sort -u) | wc -l)"
		(( c0+=c1 ))
	    fi
	done  <<< "$(paste -d"," <(echo "$s1e") \
    		  	     <(echo "$s2e" | sed -n "$i,$((i+n1-1))p"))"
	(( c>0 )) && echo $c,$c0,$tt
    done
}

exprdist "$s1" "$s2"


