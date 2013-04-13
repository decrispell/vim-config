#!/usr/bin/env bash

pushd $1
tar -cf clang_complete.tar `find  -path ./CMakeFiles -prune -o -name .clang_complete -print` 
popd
tar -xvf $1/clang_complete.tar

