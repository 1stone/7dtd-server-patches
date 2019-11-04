#!/bin/sh

for i in `dirname $0`/patches/*.patch; do
  echo =================================================
  echo Applying patch `basename $i`
  patch -N -b -d / -r - -p0 < $i
done
