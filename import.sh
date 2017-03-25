#!/bin/bash

lsre="../journal/journal-$(yyyymmdd)-*.tex"

if src_flist=$(2>/dev/null ls ${lsre}) && [ -n "${src_flist}" ]
then

    for src in ${src_flist}
    do
	tgt=$(basename ${src} .tex | sed 's/journal/distance/').tex

	if [ ! -f "${tgt}" ]
	then

	    egrep -v '\\(input|bye) ' ${src} > ${tgt}

	    2>/dev/null git add ${tgt}

	    echo "U ${tgt}"
	else
	    echo "X ${tgt}"
	fi

    done
    exit 0
else
    cat<<EOF>&2
$0 error file '${lsre}' not found.
EOF

    exit 1
fi
