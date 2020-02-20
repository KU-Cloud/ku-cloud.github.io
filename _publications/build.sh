#!/usr/bin/env bash

log="./buildlog"

function mkjson {
    tmp=$(mktemp)
    out=$(mktemp)
    bibs=$1

    
    # uncomment below if you wnat to validate bib files
    # for bib in $bibs; do
    #     if npx citation-js -i $bib -o $out 2>&1 >/dev/null | grep -q Error; then
    #         >&2 echo "error from $bib"
    #     fi
    # done

    for bib in $bibs; do
        cat $bib >> $tmp
        echo -e "\n" >> $tmp
    done

    npx citation-js -i $tmp -o $out
    # rm $tmp
    rm $out

    cat $out".json" | jq '.' > $out"f.json"
    rm $out".json"
    echo $out"f.json"
}

# echo "
# =====================================
# process journal/international...
# ====================================="
 mv $(mkjson "./journal/international/*.bib") ../_data/publications-ji.yaml

# echo "
# =====================================
# process conference/international...
# ====================================="
# mv $(mkjson "./conference/international/*.bib") ../_data/publications-ci.yaml

# echo "
# =====================================
# process journal/domestic...
# ====================================="
# mv $(mkjson "./journal/domestic/*.bib") ../_data/publications-jd.yaml

# echo "
# =====================================
# process conference/domestic...
# ====================================="
# mv $(mkjson "./conference/domestic/*.bib") ../_data/publications-cd.yaml


