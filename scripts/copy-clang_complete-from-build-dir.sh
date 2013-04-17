#!/usr/bin/env bash
# Copy all .clang_complete files from the build tree into the source tree

# exit on failure of any command
set -e 

# need to at least specify the binary dir
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

# move to the binary directory and recursively grab all .clang_complete files
pushd $BINDIR
tar -cf clang_complete.tar `find . -path ./CMakeFiles -prune -o -name .clang_complete -print` 
popd

# move to the source directory and copy in the .clang_complete files
# this assumes that the directory structure of the build and source trees are identical.
pushd $SRCDIR
tar -xvf $BINDIR/clang_complete.tar
popd 

echo "done."

