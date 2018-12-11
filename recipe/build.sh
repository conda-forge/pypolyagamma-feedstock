#!/bin/bash

export USE_CYTHON=True

CMD="$PYTHON -m pip install . --no-deps -vv "

if [[ `uname` != "Darwin" ]] || [[ "$CC" != "clang" ]]; then
    export USE_OPENMP=True
    if [[ `uname` == "Darwin" ]]; then
        export CFLAGS="${CFLAGS} -I${PREFIX}/lib/clang/4.0.1/include"
    fi
fi

${CMD}
