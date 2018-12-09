#!/bin/bash

export USE_CYTHON=True
if [[ `uname` != "Darwin" ]] || [[ "$CC" != "clang" ]]; then
    export USE_OPENMP=True
fi
$PYTHON -m pip install . --no-deps -vv
