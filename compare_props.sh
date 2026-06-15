#!/bin/bash
# compare_props.sh
#
# Run prop_comparison on all pairs of propagators in ../props/:
#   CLOVER          (qdp-jit + quda_bigcg)
#   EXP_CLOVER      (qdp-jit only)
#   EXP_CLOVER      (qdp-jit + quda_bigcg)

set -e

CURR_DIR=$(pwd)
EXE="${CURR_DIR}/prop_comparison 2 2 4 4 -geom 1 1 1 1  "

# Source the qdp-jit environment (adjust path if needed)
pushd /lustre/orion/scratch/mcamacho/stf006/exp_clover/hip-jit
source env.sh
popd
#cd /lustre/orion/scratch/mcamacho/stf006/exp_clover/hip-jit_rocm6.2.4/props

# ---- Paths ----------------------------------------------------------------
PROPS_DIR="/lustre/orion/scratch/mcamacho/stf006/exp_clover/hip-jit_rocm6.2.4/props/"





#l2_2_4_4_Pure_gauge_CLOVER_prop_m0p307_x0y0z0t0_1_qdp-jit_swf.lime  l2_2_4_4_Pure_gauge_EXP_CLOVER_prop_m0p307_x0y0z0t0_1_qdp-jit_quda_bigcg.lime
#l2_2_4_4_Pure_gauge_CLOVER_prop_m0p307_x0y0z0t0_1_qdpxx.lime	    l2_2_4_4_Pure_gauge_EXP_CLOVER_prop_m0p407_x0y0z0t0_1_qdp-jit_quda_bigcg.lime
#l2_2_4_4_Pure_gauge_EXP_CLOVER_prop_m0p307_x0y0z0t0_1_qdp-jit.lime


PROP_CLOVER="l2_2_4_4_Pure_gauge_EXP_CLOVER_prop_m0p407_x0y0z0t0_1_qdp-jit_quda_bigcg"
PROP_EXP_JIT="l2_2_4_4_Pure_gauge_CLOVER_prop_m0p307_x0y0z0t0_1_qdp-jit_swf"
PROP_EXP_QUDA="l2_2_4_4_Pure_gauge_EXP_CLOVER_prop_m0p307_x0y0z0t0_1_qdp-jit_quda_bigcg"

ls ${PROPS_DIR}/${PROP_CLOVER}.lime
ls ${PROPS_DIR}/${PROP_EXP_JIT}.lime
ls ${PROPS_DIR}/${PROP_EXP_QUDA}.lime

# ---- Run ------------------------------------------------------------------
echo "=== CLOVER vs EXP_CLOVER (qdp-jit only) ==="
echo "${EXE} ${PROPS_DIR} ${PROP_CLOVER} ${PROP_EXP_JIT}"
${EXE} "${PROPS_DIR}" "${PROP_CLOVER}" "${PROP_EXP_JIT}"

sleep 5
echo ""
echo "=== CLOVER vs EXP_CLOVER (qdp-jit + quda_bigcg) ==="
echo "${EXE} ${PROPS_DIR} ${PROP_CLOVER} ${PROP_EXP_QUDA}"
${EXE}  "${PROPS_DIR}" "${PROP_CLOVER}" "${PROP_EXP_QUDA}"

#sleep 5
#echo ""
#echo "=== EXP_CLOVER (qdp-jit only) vs EXP_CLOVER (qdp-jit + quda_bigcg) ==="
#${EXE} "${PROP_EXP_JIT}" "${PROP_EXP_QUDA}"



