#!/bin/bash
export PATH=$PATH:/cygdrive/c/Users/user/.conda/envs/or9.3/Scripts
mkdir build
cp -f *.png build/
for nb in $(ls *.ipynb)
do
    cp $nb build/
    cd build
    jupyter nbconvert --to=latex $nb
    cp ${nb%.ipynb}.tex ${nb%.ipynb}_.tex
    cat ${nb%.ipynb}_.tex | sed -r 's/section\{/section*\{/g' | sed -r 's/paragraph\{/paragraph*\{/g' > ${nb%.ipynb}.tex
    xelatex ${nb%.ipynb}.tex
    cd ..
done
