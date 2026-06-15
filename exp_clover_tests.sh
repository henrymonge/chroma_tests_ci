#!/bin/bash

#Compile and run prop comparison
CURR_DIR=`pwd`




if [ "${1}" == "qdpxx" ]; then
    pushd /lustre/orion/scratch/mcamacho/stf006/exp_clover/hip
    source env.sh
    EXE=exp_clover_qdp_tests
    export JIT=0
    popd
else
    export JIT=1
    pushd /lustre/orion/scratch/mcamacho/stf006/exp_clover/hip-jit
        if [ "${1}" == "clover" ]; then
            source env_swf.sh
            export CLOVER=1
            EXE=clover_tests
        else
            source env.sh
            export CLOVER=0
            EXE=exp_clover_tests
        fi
    popd
fi

echo "${INSTALLROOT}/${CHROMA}"
#set -e

SRC=exp_clover_tests.cpp


# These should already be defined in your environment;
# uncomment and adjust only if needed.
# export CHROMA_DIR=/path/to/chroma
# export QDP_DIR=/path/to/qdp++
# export QMP_DIR=/path/to/qmp
export CRAY_CPU_TARGET=x86-64
CXX=CC   # or mpicxx / hipcc-wrapper / clang++, depending on your setup


CXXFLAGS="-O3 -std=c++20 -g -O0 --offload-arch=gfx90a -DCLOVER=${CLOVER} -DJIT=${JIT}"
LDFLAGS=""


echo "${CXX} ${CXXFLAGS} \
  -I${INSTALLROOT}/${CHROMA}/include \
  -I${INSTALLROOT}/${QDP}/include \
  -I${INSTALLROOT}/${QMP}/include \
  ${SRC} \
  -L${INSTALLROOT}/${CHROMA}/lib -lchromalib \
  -L${INSTALLROOT}/${QDP}/lib -lqdp \
  -L${INSTALLROOT}/${QMP}/lib -lqmp \
  ${MPI_LDFLAGS} \
  -o ${EXE}
"

${CXX} ${CXXFLAGS} \
  -I${INSTALLROOT}/${CHROMA}/include \
  -I${INSTALLROOT}/${QDP}/include \
  -I${INSTALLROOT}/${QMP}/include \
  -I${INSTALLROOT}/gmp/include \
  ${SRC} \
  -L${INSTALLROOT}/${CHROMA}/lib -lchromalib \
  -L${INSTALLROOT}/${QDP}/lib -lqdp \
  -L${INSTALLROOT}/${QMP}/lib -lqmp \
  ${MPI_LDFLAGS} \
  -o ${EXE}


#  -L${INSTALLROOT}/${QDP}/lib -lqdp -ljit \

echo "Built ${EXE}"



