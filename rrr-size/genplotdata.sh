#!/bin/bash

rm -f plot.dat

for f in `ls sdsl* | grep -ve "lite"`; do
  bits=`echo "${f}" | awk -F "-" '{print $2}' | awk -F "." '{print $1}'`
  cat ${f} | tail -n+2 | awk -v b=${bits} '{print b" "$4" 0."substr($5,6)'} >> plot.dat
  echo >> plot.dat
done
