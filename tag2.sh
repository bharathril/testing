#!/bin/bash
CURRENT_BRANCH=$(git symbolic-ref --short HEAD)
TAG_FORMAT="$CURRENT_BRANCH-%Y%m%d-V1.0"
varone=$(git describe --tags | cut -d '.' -f 1)
vartwo=$(git describe --tags | cut -d '.' -f 2)
varthree=$((vartwo + 1))
echo "$varthree"
newformat="$varone.$varthree"
    
git tag $newformat   