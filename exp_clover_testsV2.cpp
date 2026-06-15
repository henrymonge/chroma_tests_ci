#include "chroma.h"

using namespace Chroma;

int main(int argc, char* argv[])
{
  Chroma::initialize(&argc,&argv);

  // ---- Lattice size ----
  multi1d<int> nrow(4);
  nrow[0]=2; nrow[1]=2; nrow[2]=4; nrow[3]=4;

  Layout::setLattSize(nrow);
  Layout::create();
 

  // ---- Gauge field ----
  const int Nd = 4;
  multi1d<LatticeColorMatrix> u(Nd);

  for(int mu=0; mu<Nd; mu++) {
    gaussian(u[mu]);
    reunit(u[mu]);
  }

  // ---- Boundary conditions ----
  multi1d<int> bcs(Nd);
  bcs = 1;
  bcs[3] = -1;

  Handle<FermState<LatticeFermion,
                    multi1d<LatticeColorMatrix>,
                    multi1d<LatticeColorMatrix>>> state(
      new SimpleFermState<LatticeFermion,
                          multi1d<LatticeColorMatrix>,
                          multi1d<LatticeColorMatrix>>(bcs,u));

  // ---- Clover parameters ----
  CloverFermActParams params;
  params.Mass = Real(0.1);
  params.clovCoeffR = 1.0;
  params.clovCoeffT = 1.0;
  params.u0 = 1.0;
  params.anisoParam.anisoP = false;
  params.twisted_m = 0.0;
  params.twisted_m_usedP = false;

  // ---- Fermion fields ----
  LatticeFermion psi, chi;
  gaussian(psi);
  chi = zero;

  // ---- Exp Clover term ----
  CloverTerm clov;
  clov.create(state, params);

  QDPIO::cout << "Volume=" << Layout::vol() << std::endl;
  QDPIO::cout << "RB0=" << rb[0].siteTable().size() << std::endl;
  QDPIO::cout << "RB1=" << rb[1].siteTable().size() << std::endl;

for (int cb = 0; cb < 2; ++cb) {

  QDPIO::cout << "Applying cb=" << cb << std::endl;

  for(int site=0; site<rb[cb].siteTable().size(); site++) {

    int idx = rb[cb].siteTable()[site];

    QDPIO::cout << "Testing site " << idx << std::endl;

    clov.apply(chi, psi, PLUS, cb);

  }
}

/*
  // ---- Apply ----
  for(int cb=0; cb<2; cb++) {
      clov.apply(chi, psi, PLUS, cb);
  }
*/
  QDPIO::cout << "ExpCloverTerm apply finished" << std::endl;

  Chroma::finalize();
  return 0;
}
