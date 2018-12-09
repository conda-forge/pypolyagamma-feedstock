#!/bin/bash

export USE_CYTHON=True

CMD="$PYTHON -m pip install . --no-deps -vv --global-option=\"build_ext\""
CMD="${CMD} --global-option=\"-I${PREFIX}/include\""
CMD="${CMD} --global-option=\"-L${PREFIX}/lib\""
CMD="${CMD} --global-option=\"-R${PREFIX}/lib\""

if [[ `uname` != "Darwin" ]] || [[ "$CC" != "clang" ]]; then
    export USE_OPENMP=True
    CMD="${CMD} --global-option=\"-I${PREFIX}/lib/clang/4.0.1/include\""
fi

${CMD}