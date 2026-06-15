#!/bin/bash

#Compile and run prop comparison
CURR_DIR=`pwd`
pushd /lustre/orion/scratch/mcamacho/stf006/exp_clover/hip-jit
source env.sh
popd

#set -e
export CRAY_CPU_TARGET=x86-64
SRC=prop_comparison.cpp
EXE=prop_comparison

# These should already be defined in your environment;
# uncomment and adjust only if needed.
# export CHROMA_DIR=/path/to/chroma
# export QDP_DIR=/path/to/qdp++
# export QMP_DIR=/path/to/qmp

CXX=CC   # or mpicxx / hipcc-wrapper / clang++, depending on your setup


CXXFLAGS="-O3 -std=c++20"
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
  -L${INSTALLROOT}/${QDP}/lib -lqdp -ljit \
  -L${INSTALLROOT}/${QMP}/lib -lqmp \
  ${MPI_LDFLAGS} \
  -o ${EXE}

echo "Built ${EXE}"



