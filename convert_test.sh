#!/bin/bash
export PATH=$PATH:/cygdrive/c/Users/fuenfzig/.conda/envs/py37/Scripts
mkdir cleaned
cp -f *.png cleaned
cat 4_01_Grenzwerte.ipynb | sed -r 's/<br>/  /g' | sed -r 's/\$\$([^$]*)\$\$/\\\\[\1\\\\]/g' | sed -r 's/\$([^$]*)\$/\\\\(\1\\\\)/g' > cleaned/4_01_Grenzwerte.ipynb

