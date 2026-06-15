/lustre/orion/scratch/mcamacho/stf006/exp_clover/hip-jit ~/lqcd_miniapps

The following have been reloaded with a version change:
  1) amd/6.2.4 => amd/6.0.0


Currently Loaded Modules:
  1) Core/25.03         5) craype-network-ofi    9) rocm/6.0.0               13) gcc-mixed/12.2.0
  2) craype/2.7.33      6) PrgEnv-amd/8.6.0     10) craype-accel-amd-gfx90a  14) ninja/1.12.1     (E4S)
  3) cray-dsmml/0.3.0   7) amd/6.0.0            11) cray-mpich/8.1.31
  4) libfabric/1.22.0   8) cray-libsci/24.11.0  12) cmake/3.30.5

  Where:
   E4S:  E4S: Extreme-scale Scientific Software Stack (E4S) https://e4s.io/index.html

 

~/lqcd_miniapps
/lustre/orion/scratch/mcamacho/stf006/exp_clover/hip-jit/install/exp-clover-jit
CC -O3 -std=c++20 -DCLOVER=0   -I/lustre/orion/scratch/mcamacho/stf006/exp_clover/hip-jit/install/exp-clover-jit/include   -I/lustre/orion/scratch/mcamacho/stf006/exp_clover/hip-jit/install/qdp-jit/include   -I/lustre/orion/scratch/mcamacho/stf006/exp_clover/hip-jit/install/qmp/include   exp_clover_tests.cpp   -L/lustre/orion/scratch/mcamacho/stf006/exp_clover/hip-jit/install/exp-clover-jit/lib -lchromalib   -L/lustre/orion/scratch/mcamacho/stf006/exp_clover/hip-jit/install/qdp-jit/lib -lqdp   -L/lustre/orion/scratch/mcamacho/stf006/exp_clover/hip-jit/install/qmp/lib -lqmp   -L/opt/cray/libfabric/1.22..0/lib64  -Wl,--rpath=/opt/cray/libfabric/1.22.0/lib64  -lxpmem  -Wl,-rpath=/opt/cray/pe/mpich/8.1.31/ofi/amd/6.0/lib -L/opt/cray/pe/mpich/8.1.31/ofi/amd/6.0/lib -lmpi -Wl,-rpath=-L/opt/cray/pe/mpich/8.1.31/gtl/lib -L-L/opt/cray/pe/mpich/8.1.31/gtl/lib -lmpi_gtl_hsa -L/lustre/orion/scratch/mcamacho/stf006/exp_clover/hip-jit/install/llvm/lib -Wl,-rpath=/lustre/orion/scratch/mcamacho/stf006/exp_clover/hip-jit/install/llvm/lib -L/opt/cray/pe/mpich/8.1.31/ofi/amd/6.0/lib -lmpi -L/opt/cray/pe/mpich/8.1.31/gtl/lib -lmpi_gtl_hsa    -o exp_clover_tests

In file included from exp_clover_tests.cpp:2:
In file included from /lustre/orion/scratch/mcamacho/stf006/exp_clover/hip-jit/install/exp-clover-jit/include/chroma.h:29:
In file included from /lustre/orion/scratch/mcamacho/stf006/exp_clover/hip-jit/install/exp-clover-jit/include/chromainc.h:10:
In file included from /lustre/orion/scratch/mcamacho/stf006/exp_clover/hip-jit/install/exp-clover-jit/include/lib.h:23:
/lustre/orion/scratch/mcamacho/stf006/exp_clover/hip-jit/install/exp-clover-jit/include/unprec_wilstype_fermact_w.h:29:42: warning: 'linOp' overrides a member function but is not marked 'override' [-Winconsistent-missing-override]
    virtual UnprecLinearOperator<T,P,Q>* linOp(Handle< FermState<T,P,Q> > state) const = 0;
                                         ^
/lustre/orion/scratch/mcamacho/stf006/exp_clover/hip-jit/install/exp-clover-jit/include/actions/ferm/fermacts/unprec_wilson_fermact_w.h:30:38: note: in instantiation of template class 'Chroma::UnprecWilsonTypeFermAct<QDP::OLattice<QDP::PSpinVector<QDP::PColorVector<QDP::RComplex<QDP::Word<double>>, 3>, 4>>, QDP::multi1d<QDP::OLattice<QDP::PScalar<QDP::PColorMatrix<QDP::RComplex<QDP::Word<double>>, 3>>>>, QDP::multi1d<QDP::OLattice<QDP::PScalar<QDP::PColorMatrix<QDP::RComplex<QDP::Word<double>>, 3>>>>>' requested here
  class UnprecWilsonFermAct : public UnprecWilsonTypeFermAct<LatticeFermion, 
                                     ^
/lustre/orion/scratch/mcamacho/stf006/exp_clover/hip-jit/install/exp-clover-jit/include/fermact.h:241:40: note: overridden virtual function is here
    virtual DiffLinearOperator<T,Q,P>* linOp(Handle< FermState<T,P,Q> > state) const = 0;
                                       ^
In file included from exp_clover_tests.cpp:2:
In file included from /lustre/orion/scratch/mcamacho/stf006/exp_clover/hip-jit/install/exp-clover-jit/include/chroma.h:29:
In file included from /lustre/orion/scratch/mcamacho/stf006/exp_clover/hip-jit/install/exp-clover-jit/include/chromainc.h:10:
In file included from /lustre/orion/scratch/mcamacho/stf006/exp_clover/hip-jit/install/exp-clover-jit/include/lib.h:45:
In file included from /lustre/orion/scratch/mcamacho/stf006/exp_clover/hip-jit/install/exp-clover-jit/include/actions/actions.h:21:
In file included from /lustre/orion/scratch/mcamacho/stf006/exp_clover/hip-jit/install/exp-clover-jit/include/actions/ferm/ferm.h:20:
In file included from /lustre/orion/scratch/mcamacho/stf006/exp_clover/hip-jit/install/exp-clover-jit/include/actions/ferm/fermacts/fermacts.h:18:
In file included from /lustre/orion/scratch/mcamacho/stf006/exp_clover/hip-jit/install/exp-clover-jit/include/actions/ferm/fermacts/fermacts_w.h:17:
/lustre/orion/scratch/mcamacho/stf006/exp_clover/hip-jit/install/exp-clover-jit/include/actions/ferm/fermacts/unprec_clover_fermact_w.h:48:34: warning: 'linOp' overrides a member function but is not marked 'override' [-Winconsistent-missing-override]
    UnprecLinearOperator<T,P,Q>* linOp(Handle< FermState<T,P,Q> > state) const;
                                 ^
/lustre/orion/scratch/mcamacho/stf006/exp_clover/hip-jit/install/exp-clover-jit/include/unprec_wilstype_fermact_w.h:29:42: note: overridden virtual function is here
    virtual UnprecLinearOperator<T,P,Q>* linOp(Handle< FermState<T,P,Q> > state) const = 0;
                                         ^
In file included from exp_clover_tests.cpp:2:
In file included from /lustre/orion/scratch/mcamacho/stf006/exp_clover/hip-jit/install/exp-clover-jit/include/chroma.h:29:
In file included from /lustre/orion/scratch/mcamacho/stf006/exp_clover/hip-jit/install/exp-clover-jit/include/chromainc.h:10:
In file included from /lustre/orion/scratch/mcamacho/stf006/exp_clover/hip-jit/install/exp-clover-jit/include/lib.h:45:
In file included from /lustre/orion/scratch/mcamacho/stf006/exp_clover/hip-jit/install/exp-clover-jit/include/actions/actions.h:21:
In file included from /lustre/orion/scratch/mcamacho/stf006/exp_clover/hip-jit/install/exp-clover-jit/include/actions/ferm/ferm.h:20:
In file included from /lustre/orion/scratch/mcamacho/stf006/exp_clover/hip-jit/install/exp-clover-jit/include/actions/ferm/fermacts/fermacts.h:18:
In file included from /lustre/orion/scratch/mcamacho/stf006/exp_clover/hip-jit/install/exp-clover-jit/include/actions/ferm/fermacts/fermacts_w.h:17:
/lustre/orion/scratch/mcamacho/stf006/exp_clover/hip-jit/install/exp-clover-jit/include/actions/ferm/fermacts/unprec_clover_fermact_w.h:50:24: warning: 'hermitianLinOp' overrides a member function but is not marked 'override' [-Winconsistent-missing-override]
    LinearOperator<T>* hermitianLinOp(Handle< FermState<T,P,Q> > state) const 
                       ^
/lustre/orion/scratch/mcamacho/stf006/exp_clover/hip-jit/install/exp-clover-jit/include/wilstype_fermact_w.h:37:32: note: overridden virtual function is here
    virtual LinearOperator<T>* hermitianLinOp(Handle< FermState<T,P,Q> > state) const = 0;
                               ^
In file included from exp_clover_tests.cpp:2:
In file included from /lustre/orion/scratch/mcamacho/stf006/exp_clover/hip-jit/install/exp-clover-jit/include/chroma.h:29:
In file included from /lustre/orion/scratch/mcamacho/stf006/exp_clover/hip-jit/install/exp-clover-jit/include/chromainc.h:10:
In file included from /lustre/orion/scratch/mcamacho/stf006/exp_clover/hip-jit/install/exp-clover-jit/include/lib.h:45:
In file included from /lustre/orion/scratch/mcamacho/stf006/exp_clover/hip-jit/install/exp-clover-jit/include/actions/actions.h:21:
In file included from /lustre/orion/scratch/mcamacho/stf006/exp_clover/hip-jit/install/exp-clover-jit/include/actions/ferm/ferm.h:20:
In file included from /lustre/orion/scratch/mcamacho/stf006/exp_clover/hip-jit/install/exp-clover-jit/include/actions/ferm/fermacts/fermacts.h:18:
In file included from /lustre/orion/scratch/mcamacho/stf006/exp_clover/hip-jit/install/exp-clover-jit/include/actions/ferm/fermacts/fermacts_w.h:17:
/lustre/orion/scratch/mcamacho/stf006/exp_clover/hip-jit/install/exp-clover-jit/include/actions/ferm/fermacts/unprec_clover_fermact_w.h:64:35: warning: 'getCreateState' overrides a member function but is not marked 'override' [-Winconsistent-missing-override]
    const CreateFermState<T,P,Q>& getCreateState() const {return *cfs;}
                                  ^
/lustre/orion/scratch/mcamacho/stf006/exp_clover/hip-jit/install/exp-clover-jit/include/fermact.h:92:43: note: overridden virtual function is here
    virtual const CreateFermState<T,P,Q>& getCreateState() const = 0;
                                          ^
In file included from exp_clover_tests.cpp:2:
In file included from /lustre/orion/scratch/mcamacho/stf006/exp_clover/hip-jit/install/exp-clover-jit/include/chroma.h:29:
In file included from /lustre/orion/scratch/mcamacho/stf006/exp_clover/hip-jit/install/exp-clover-jit/include/chromainc.h:10:
In file included from /lustre/orion/scratch/mcamacho/stf006/exp_clover/hip-jit/install/exp-clover-jit/include/lib.h:24:
/lustre/orion/scratch/mcamacho/stf006/exp_clover/hip-jit/install/exp-clover-jit/include/eoprec_wilstype_fermact_w.h:31:47: warning: 'linOp' overrides a member function but is not marked 'override' [-Winconsistent-missing-override]
    virtual EvenOddPrecLinearOperator<T,P,Q>* linOp(Handle< FermState<T,P,Q> > state) const = 0;
                                              ^
/lustre/orion/scratch/mcamacho/stf006/exp_clover/hip-jit/install/exp-clover-jit/include/eoprec_constdet_wilstype_fermact_w.h:22:55: note: in instantiation of template class 'Chroma::EvenOddPrecWilsonTypeFermAct<QDP::OLattice<QDP::PSpinVector<QDP::PColorVector<QDP::RComplex<QDP::Word<double>>, 3>, 4>>, QDP::multi1d<QDP::OLattice<QDP::PScalar<QDP::PColorMatrix<QDP::RComplex<QDP::Word<double>>, 3>>>>, QDP::multi1d<QDP::OLattice<QDP::PScalar<QDP::PColorMatrix<QDP::RComplex<QDP::Word<double>>, 3>>>>>' requested here
  class EvenOddPrecConstDetWilsonTypeFermAct : public EvenOddPrecWilsonTypeFermAct<T,P,Q>
                                                      ^
/lustre/orion/scratch/mcamacho/stf006/exp_clover/hip-jit/install/exp-clover-jit/include/actions/ferm/fermacts/eoprec_wilson_fermact_w.h:30:43: note: in instantiation of template class 'Chroma::EvenOddPrecConstDetWilsonTypeFermAct<QDP::OLattice<QDP::PSpinVector<QDP::PColorVector<QDP::RComplex<QDP::Word<double>>, 3>, 4>>, QDP::multi1d<QDP::OLattice<QDP::PScalar<QDP::PColorMatrix<QDP::RComplex<QDP::Word<double>>, 3>>>>, QDP::multi1d<QDP::OLattice<QDP::PScalar<QDP::PColorMatrix<QDP::RComplex<QDP::Word<double>>, 3>>>>>' requested here
  class EvenOddPrecWilsonFermAct : public EvenOddPrecConstDetWilsonTypeFermAct<LatticeFermion, 
                                          ^
/lustre/orion/scratch/mcamacho/stf006/exp_clover/hip-jit/install/exp-clover-jit/include/fermact.h:241:40: note: overridden virtual function is here
    virtual DiffLinearOperator<T,Q,P>* linOp(Handle< FermState<T,P,Q> > state) const = 0;
                                       ^
In file included from exp_clover_tests.cpp:2:
In file included from /lustre/orion/scratch/mcamacho/stf006/exp_clover/hip-jit/install/exp-clover-jit/include/chroma.h:29:
In file included from /lustre/orion/scratch/mcamacho/stf006/exp_clover/hip-jit/install/exp-clover-jit/include/chromainc.h:10:
In file included from /lustre/orion/scratch/mcamacho/stf006/exp_clover/hip-jit/install/exp-clover-jit/include/lib.h:24:
/lustre/orion/scratch/mcamacho/stf006/exp_clover/hip-jit/install/exp-clover-jit/include/eoprec_wilstype_fermact_w.h:41:30: warning: 'qprop' overrides a member function but is not marked 'override' [-Winconsistent-missing-override]
    virtual SystemSolver<T>* qprop(Handle< FermState<T,P,Q> > state,
                             ^
/lustre/orion/scratch/mcamacho/stf006/exp_clover/hip-jit/install/exp-clover-jit/include/fermact.h:221:30: note: overridden virtual function is here
    virtual SystemSolver<T>* qprop(Handle< FermState<T,P,Q> > state,
                             ^
In file included from exp_clover_tests.cpp:2:
In file included from /lustre/orion/scratch/mcamacho/stf006/exp_clover/hip-jit/install/exp-clover-jit/include/chroma.h:29:
In file included from /lustre/orion/scratch/mcamacho/stf006/exp_clover/hip-jit/install/exp-clover-jit/include/chromainc.h:10:
In file included from /lustre/orion/scratch/mcamacho/stf006/exp_clover/hip-jit/install/exp-clover-jit/include/lib.h:45:
In file included from /lustre/orion/scratch/mcamacho/stf006/exp_clover/hip-jit/install/exp-clover-jit/include/actions/actions.h:21:
In file included from /lustre/orion/scratch/mcamacho/stf006/exp_clover/hip-jit/install/exp-clover-jit/include/actions/ferm/ferm.h:20:
In file included from /lustre/orion/scratch/mcamacho/stf006/exp_clover/hip-jit/install/exp-clover-jit/include/actions/ferm/fermacts/fermacts.h:18:
In file included from /lustre/orion/scratch/mcamacho/stf006/exp_clover/hip-jit/install/exp-clover-jit/include/actions/ferm/fermacts/fermacts_w.h:19:
/lustre/orion/scratch/mcamacho/stf006/exp_clover/hip-jit/install/exp-clover-jit/include/actions/ferm/fermacts/eoprec_wilson_fermact_w.h:54:47: warning: 'linOp' overrides a member function but is not marked 'override' [-Winconsistent-missing-override]
    EvenOddPrecConstDetLinearOperator<T,P,Q>* linOp(Handle< FermState<T,P,Q> > state) const;
                                              ^
/lustre/orion/scratch/mcamacho/stf006/exp_clover/hip-jit/install/exp-clover-jit/include/eoprec_constdet_wilstype_fermact_w.h:30:55: note: overridden virtual function is here
    virtual EvenOddPrecConstDetLinearOperator<T,P,Q>* linOp(Handle< FermState<T,P,Q> > state) const = 0;
                                                      ^
In file included from exp_clover_tests.cpp:2:
In file included from /lustre/orion/scratch/mcamacho/stf006/exp_clover/hip-jit/install/exp-clover-jit/include/chroma.h:29:
In file included from /lustre/orion/scratch/mcamacho/stf006/exp_clover/hip-jit/install/exp-clover-jit/include/chromainc.h:10:
In file included from /lustre/orion/scratch/mcamacho/stf006/exp_clover/hip-jit/install/exp-clover-jit/include/lib.h:45:
In file included from /lustre/orion/scratch/mcamacho/stf006/exp_clover/hip-jit/install/exp-clover-jit/include/actions/actions.h:21:
In file included from /lustre/orion/scratch/mcamacho/stf006/exp_clover/hip-jit/install/exp-clover-jit/include/actions/ferm/ferm.h:20:
In file included from /lustre/orion/scratch/mcamacho/stf006/exp_clover/hip-jit/install/exp-clover-jit/include/actions/ferm/fermacts/fermacts.h:18:
In file included from /lustre/orion/scratch/mcamacho/stf006/exp_clover/hip-jit/install/exp-clover-jit/include/actions/ferm/fermacts/fermacts_w.h:19:
/lustre/orion/scratch/mcamacho/stf006/exp_clover/hip-jit/install/exp-clover-jit/include/actions/ferm/fermacts/eoprec_wilson_fermact_w.h:57:24: warning: 'hermitianLinOp' overrides a member function but is not marked 'override' [-Winconsistent-missing-override]
    LinearOperator<T>* hermitianLinOp(Handle< FermState<T,P,Q> > state) const 
                       ^
/lustre/orion/scratch/mcamacho/stf006/exp_clover/hip-jit/install/exp-clover-jit/include/wilstype_fermact_w.h:37:32: note: overridden virtual function is here
    virtual LinearOperator<T>* hermitianLinOp(Handle< FermState<T,P,Q> > state) const = 0;
                               ^
In file included from exp_clover_tests.cpp:2:
In file included from /lustre/orion/scratch/mcamacho/stf006/exp_clover/hip-jit/install/exp-clover-jit/include/chroma.h:29:
In file included from /lustre/orion/scratch/mcamacho/stf006/exp_clover/hip-jit/install/exp-clover-jit/include/chromainc.h:10:
In file included from /lustre/orion/scratch/mcamacho/stf006/exp_clover/hip-jit/install/exp-clover-jit/include/lib.h:45:
In file included from /lustre/orion/scratch/mcamacho/stf006/exp_clover/hip-jit/install/exp-clover-jit/include/actions/actions.h:21:
In file included from /lustre/orion/scratch/mcamacho/stf006/exp_clover/hip-jit/install/exp-clover-jit/include/actions/ferm/ferm.h:20:
In file included from /lustre/orion/scratch/mcamacho/stf006/exp_clover/hip-jit/install/exp-clover-jit/include/actions/ferm/fermacts/fermacts.h:18:
In file included from /lustre/orion/scratch/mcamacho/stf006/exp_clover/hip-jit/install/exp-clover-jit/include/actions/ferm/fermacts/fermacts_w.h:19:
/lustre/orion/scratch/mcamacho/stf006/exp_clover/hip-jit/install/exp-clover-jit/include/actions/ferm/fermacts/eoprec_wilson_fermact_w.h:63:27: warning: 'invLinOp' overrides a member function but is not marked 'override' [-Winconsistent-missing-override]
    LinOpSystemSolver<T>* invLinOp(Handle< FermState<T,P,Q> > state,
                          ^
/lustre/orion/scratch/mcamacho/stf006/exp_clover/hip-jit/install/exp-clover-jit/include/wilstype_fermact_w.h:41:35: note: overridden virtual function is here
    virtual LinOpSystemSolver<T>* invLinOp(Handle< FermState<T,P,Q> > state,
                                  ^
In file included from exp_clover_tests.cpp:2:
In file included from /lustre/orion/scratch/mcamacho/stf006/exp_clover/hip-jit/install/exp-clover-jit/include/chroma.h:29:
In file included from /lustre/orion/scratch/mcamacho/stf006/exp_clover/hip-jit/install/exp-clover-jit/include/chromainc.h:10:
In file included from /lustre/orion/scratch/mcamacho/stf006/exp_clover/hip-jit/install/exp-clover-jit/include/lib.h:45:
In file included from /lustre/orion/scratch/mcamacho/stf006/exp_clover/hip-jit/install/exp-clover-jit/include/actions/actions.h:21:
In file included from /lustre/orion/scratch/mcamacho/stf006/exp_clover/hip-jit/install/exp-clover-jit/include/actions/ferm/ferm.h:20:
In file included from /lustre/orion/scratch/mcamacho/stf006/exp_clover/hip-jit/install/exp-clover-jit/include/actions/ferm/fermacts/fermacts.h:18:
In file included from /lustre/orion/scratch/mcamacho/stf006/exp_clover/hip-jit/install/exp-clover-jit/include/actions/ferm/fermacts/fermacts_w.h:19:
/lustre/orion/scratch/mcamacho/stf006/exp_clover/hip-jit/install/exp-clover-jit/include/actions/ferm/fermacts/eoprec_wilson_fermact_w.h:67:27: warning: 'invMdagM' overrides a member function but is not marked 'override' [-Winconsistent-missing-override]
    MdagMSystemSolver<T>* invMdagM(Handle< FermState<T,P,Q> > state,
                          ^
/lustre/orion/scratch/mcamacho/stf006/exp_clover/hip-jit/install/exp-clover-jit/include/wilstype_fermact_w.h:46:35: note: overridden virtual function is here
    virtual MdagMSystemSolver<T>* invMdagM(Handle< FermState<T,P,Q> > state,
                                  ^
In file included from exp_clover_tests.cpp:2:
In file included from /lustre/orion/scratch/mcamacho/stf006/exp_clover/hip-jit/install/exp-clover-jit/include/chroma.h:29:
In file included from /lustre/orion/scratch/mcamacho/stf006/exp_clover/hip-jit/install/exp-clover-jit/include/chromainc.h:10:
In file included from /lustre/orion/scratch/mcamacho/stf006/exp_clover/hip-jit/install/exp-clover-jit/include/lib.h:45:
In file included from /lustre/orion/scratch/mcamacho/stf006/exp_clover/hip-jit/install/exp-clover-jit/include/actions/actions.h:21:
In file included from /lustre/orion/scratch/mcamacho/stf006/exp_clover/hip-jit/install/exp-clover-jit/include/actions/ferm/ferm.h:20:
In file included from /lustre/orion/scratch/mcamacho/stf006/exp_clover/hip-jit/install/exp-clover-jit/include/actions/ferm/fermacts/fermacts.h:18:
In file included from /lustre/orion/scratch/mcamacho/stf006/exp_clover/hip-jit/install/exp-clover-jit/include/actions/ferm/fermacts/fermacts_w.h:19:
/lustre/orion/scratch/mcamacho/stf006/exp_clover/hip-jit/install/exp-clover-jit/include/actions/ferm/fermacts/eoprec_wilson_fermact_w.h:83:35: warning: 'getCreateState' overrides a member function but is not marked 'override' [-Winconsistent-missing-override]
    const CreateFermState<T,P,Q>& getCreateState() const {return *cfs;}
                                  ^
/lustre/orion/scratch/mcamacho/stf006/exp_clover/hip-jit/install/exp-clover-jit/include/fermact.h:92:43: note: overridden virtual function is here
    virtual const CreateFermState<T,P,Q>& getCreateState() const = 0;
                                          ^
In file included from exp_clover_tests.cpp:2:
In file included from /lustre/orion/scratch/mcamacho/stf006/exp_clover/hip-jit/install/exp-clover-jit/include/chroma.h:29:
In file included from /lustre/orion/scratch/mcamacho/stf006/exp_clover/hip-jit/install/exp-clover-jit/include/chromainc.h:10:
In file included from /lustre/orion/scratch/mcamacho/stf006/exp_clover/hip-jit/install/exp-clover-jit/include/lib.h:45:
In file included from /lustre/orion/scratch/mcamacho/stf006/exp_clover/hip-jit/install/exp-clover-jit/include/actions/actions.h:21:
In file included from /lustre/orion/scratch/mcamacho/stf006/exp_clover/hip-jit/install/exp-clover-jit/include/actions/ferm/ferm.h:20:
In file included from /lustre/orion/scratch/mcamacho/stf006/exp_clover/hip-jit/install/exp-clover-jit/include/actions/ferm/fermacts/fermacts.h:18:
In file included from /lustre/orion/scratch/mcamacho/stf006/exp_clover/hip-jit/install/exp-clover-jit/include/actions/ferm/fermacts/fermacts_w.h:21:
/lustre/orion/scratch/mcamacho/stf006/exp_clover/hip-jit/install/exp-clover-jit/include/actions/ferm/fermacts/eoprec_clover_fermact_w.h:53:45: warning: 'linOp' overrides a member function but is not marked 'override' [-Winconsistent-missing-override]
    EvenOddPrecLogDetLinearOperator<T,P,Q>* linOp(Handle< FermState<T,P,Q> > state) const;
                                            ^
/lustre/orion/scratch/mcamacho/stf006/exp_clover/hip-jit/install/exp-clover-jit/include/eoprec_logdet_wilstype_fermact_w.h:30:53: note: overridden virtual function is here
    virtual EvenOddPrecLogDetLinearOperator<T,P,Q>* linOp(Handle< FermState<T,P,Q> > state) const = 0;
                                                    ^
In file included from exp_clover_tests.cpp:2:
In file included from /lustre/orion/scratch/mcamacho/stf006/exp_clover/hip-jit/install/exp-clover-jit/include/chroma.h:29:
In file included from /lustre/orion/scratch/mcamacho/stf006/exp_clover/hip-jit/install/exp-clover-jit/include/chromainc.h:10:
In file included from /lustre/orion/scratch/mcamacho/stf006/exp_clover/hip-jit/install/exp-clover-jit/include/lib.h:45:
In file included from /lustre/orion/scratch/mcamacho/stf006/exp_clover/hip-jit/install/exp-clover-jit/include/actions/actions.h:21:
In file included from /lustre/orion/scratch/mcamacho/stf006/exp_clover/hip-jit/install/exp-clover-jit/include/actions/ferm/ferm.h:20:
In file included from /lustre/orion/scratch/mcamacho/stf006/exp_clover/hip-jit/install/exp-clover-jit/include/actions/ferm/fermacts/fermacts.h:18:
In file included from /lustre/orion/scratch/mcamacho/stf006/exp_clover/hip-jit/install/exp-clover-jit/include/actions/ferm/fermacts/fermacts_w.h:21:
/lustre/orion/scratch/mcamacho/stf006/exp_clover/hip-jit/install/exp-clover-jit/include/actions/ferm/fermacts/eoprec_clover_fermact_w.h:56:37: warning: 'hermitianLinOp' overrides a member function but is not marked 'override' [-Winconsistent-missing-override]
    LinearOperator<LatticeFermion>* hermitianLinOp(Handle< FermState<T,P,Q> > state) const 
                                    ^
/lustre/orion/scratch/mcamacho/stf006/exp_clover/hip-jit/install/exp-clover-jit/include/wilstype_fermact_w.h:37:32: note: overridden virtual function is here
    virtual LinearOperator<T>* hermitianLinOp(Handle< FermState<T,P,Q> > state) const = 0;
                               ^
In file included from exp_clover_tests.cpp:2:
In file included from /lustre/orion/scratch/mcamacho/stf006/exp_clover/hip-jit/install/exp-clover-jit/include/chroma.h:29:
In file included from /lustre/orion/scratch/mcamacho/stf006/exp_clover/hip-jit/install/exp-clover-jit/include/chromainc.h:10:
In file included from /lustre/orion/scratch/mcamacho/stf006/exp_clover/hip-jit/install/exp-clover-jit/include/lib.h:45:
In file included from /lustre/orion/scratch/mcamacho/stf006/exp_clover/hip-jit/install/exp-clover-jit/include/actions/actions.h:21:
In file included from /lustre/orion/scratch/mcamacho/stf006/exp_clover/hip-jit/install/exp-clover-jit/include/actions/ferm/ferm.h:20:
In file included from /lustre/orion/scratch/mcamacho/stf006/exp_clover/hip-jit/install/exp-clover-jit/include/actions/ferm/fermacts/fermacts.h:18:
In file included from /lustre/orion/scratch/mcamacho/stf006/exp_clover/hip-jit/install/exp-clover-jit/include/actions/ferm/fermacts/fermacts_w.h:21:
/lustre/orion/scratch/mcamacho/stf006/exp_clover/hip-jit/install/exp-clover-jit/include/actions/ferm/fermacts/eoprec_clover_fermact_w.h:70:35: warning: 'getCreateState' overrides a member function but is not marked 'override' [-Winconsistent-missing-override]
    const CreateFermState<T,P,Q>& getCreateState() const {return *cfs;}
                                  ^
/lustre/orion/scratch/mcamacho/stf006/exp_clover/hip-jit/install/exp-clover-jit/include/fermact.h:92:43: note: overridden virtual function is here
    virtual const CreateFermState<T,P,Q>& getCreateState() const = 0;
                                          ^
14 warnings generated.
Built exp_clover_tests
