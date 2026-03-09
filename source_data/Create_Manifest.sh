#!/usr/bin/env bash

for f in DCWW*_R1_*.fastq.gz; do
    sample=$(echo "$f" | cut -d '_' -f1)
    fwd=$(readlink -f "$f")
    rev=$(readlink -f "${f/_R1_/_R2_}")
    printf "%s\t%s\t%s\n" "$sample" "$fwd" "$rev"
done > manifest.tsv
