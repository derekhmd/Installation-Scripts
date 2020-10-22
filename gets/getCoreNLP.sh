#!/bin/bash

wget http://nlp.stanford.edu/software/stanford-corenlp-full-2018-01-31.zip
unzip stanford-corenlp-full-2018-01-31.zip
rm -rf  stanford-corenlp-full-2018-01-31.zip
cd stanford-corenlp-full-2018-01-31

for file in `find . -name "*.jar"`; do export
CLASSPATH="$CLASSPATH:`realpath $file`"; done
