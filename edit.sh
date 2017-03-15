#!/bin/bash

file_txt=$(./file.sh $* txt)

if [ -f "${file_txt}" ]
then
    emacs ${file_txt} &

    exit 0
else
    cat<<EOF>&2
$0: file "${file_txt}" not found.
EOF
    exit 1
fi
