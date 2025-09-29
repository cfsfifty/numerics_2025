#!/bin/bash
export PATH=$PATH:/cygdrive/c/Users/user/.conda/envs/or9.3/Scripts
mkdir cleaned
cp -f *.png cleaned
for nb in $(ls *.ipynb)
do
    cat $nb | sed -r 's/<br>/  /g' | sed -r 's/\$\$([^$]*)\$\$/\\\\\\\\[\1\\\\\\\\]/g' | sed -r 's/\$([^$]*)\$/\\\\\\\\(\1\\\\\\\\)/g' > cleaned/$nb
done

