#!/bin/sh

FN=GlamorousToolkitLinux64-v0.8.750
FP=${FN}.zip
DL=https://dl.feenk.com/gt/GlamorousToolkitLinux64-v0.8.750.zip

if [ ! -f ${FP} ]; then
  curl -o ${FP} ${DL}
fi

if [ ! -d ${FN} ]; then
  unzip ${FP}
fi

mkdir -p image

mv ${FN}/GlamorousToolkit.changes image/
mv ${FN}/GlamorousToolkit.image image/

echo "done."
echo "now run: ./run.sh"

