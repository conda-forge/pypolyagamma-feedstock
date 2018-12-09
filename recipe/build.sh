#!/bin/bash

export USE_CYTHON=True
if [[ `uname` != "Darwin" ]] || [[ "$CC" != "clang" ]]; then
    export USE_OPENMP=True
fi
$PYTHON -m pip install . --no-deps -vv \
    --global-option="build_ext" \
    --global-option="-I${PREFIX}/include" \
    --global-option="-L${PREFIX}/lib"
