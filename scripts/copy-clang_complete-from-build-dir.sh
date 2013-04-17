#!/usr/bin/env bash
# Copy all .clang_complete files from the build tree into the source tree
if [ -z $1 ]
then
  echo "usage: $0 <binary dir> [source dir (\$PWD)]"
  exit -1
fi

BINDIR=$1
if [ -z $2 ]
then
  SRCDIR=$PWD
else
  SRCDIR=$2
fi

echo "BINDIR = $BINDIR"
echo "SRCDIR = $SRCDIR"

pushd $BINDIR
tar -cf clang_complete.tar `find . -path ./CMakeFiles -prune -o -name .clang_complete -print` 
popd

pushd $SRCDIR
tar -xvf $1/clang_complete.tar
popd 

echo "done."

