#include "chromabase.h"
#include "chroma.h"
#include "util/gauge/reunit.h"
#include "chromabase.h"
#include "chroma.h"
#include "handle.h"
#include <cmath>
#include <fstream>
#include <iostream>
#include <fstream>
#include <sstream>
#include <string>
#include <regex>

#include "actions/ferm/fermacts/clover_fermact_params_w.h"
#include "actions/ferm/fermstates/simple_fermstate.h"

#if CLOVER
    #include "actions/ferm/linop/unprec_clover_linop_w.h"
#else
    #include "actions/ferm/linop/unprec_exp_clover_linop_w.h"
#endif
using namespace Chroma;
using namespace QDP;

#include "qdp.h"

using namespace QDP;

#if CLOVER
  using ClovTermT=CloverTerm;
#else
  using ClovTermT=ExpCloverTerm;
#endif

void readLatticeFermion(LatticeFermion& f, const std::string& filename)
{
    std::ifstream infile(filename);
    if (!infile.is_open())
    {
        std::cerr << "Error: could not open file " << filename << std::endl;
        return;
    }

    std::string line;
    int qdp_index = -1;
    int s = -1;

    while (std::getline(infile, line))
    {
        // match site header "--- Site N ---"
        if (line.find("--- Site") != std::string::npos)
        {
            std::sscanf(line.c_str(), "--- Site %d ---", &qdp_index);
            continue;
        }

        // match spin header "s=N"
        if (line.find("s=") != std::string::npos && line.size() < 5)
        {
            std::sscanf(line.c_str(), "s=%d", &s);
            continue;
        }

        // match color data line: "re+imi  re+imi  re+imi"
        if (qdp_index >= 0 && s >= 0 && !line.empty())
        {
            std::istringstream iss(line);
            std::string token;
            int c = 0;

            while (iss >> token && c < 3)
            {
                // parse "re+imi" or "re+-imi"
                double re, im;
                // replace +- with - for easier parsing
                size_t pos = token.find("+-");
                if (pos != std::string::npos)
                    token.replace(pos, 2, "-");

                // find the + or - separating re and im (skip leading sign)
                size_t split = token.find_first_of("+-", 1);
                re = std::stod(token.substr(0, split));
                im = std::stod(token.substr(split, token.size() - split - 1)); // strip trailing 'i'

#if JIT
                f.elem(qdp_index).elem(s).elem(c).real().elem() = re;
                f.elem(qdp_index).elem(s).elem(c).imag().elem() = im;
#else
                f.elem(qdp_index).elem(s).elem(c).real() = re;
                f.elem(qdp_index).elem(s).elem(c).imag() = im;
#endif
                ++c;
            }
        }
    }

    infile.close();
}



#if 0
void write_inv_clover_traces(const ClovTermT& eclov)
{

#if CLOVER
    string prefix="stabilized";
#else
    string prefix="exp-clover";
#endif
  string filename=prefix+"_qdp-jit_qc_t.txt";

  // Save original cout buffer
  std::streambuf* original_buf = std::cout.rdbuf();
  std::ofstream file_out("./"+filename);

  if (!file_out.is_open()) {
    std::cerr << "ERROR: Could not open output file\n";
    return;
  }

  std::cout.rdbuf(file_out.rdbuf());

  for (int cb = 0; cb < 2; ++cb)
  {
    const Subset& sub = rb[cb];
    int numSites = sub.siteTable().size();

    for (int n = 0; n < numSites; ++n)
    {
      int qdp_index = sub.siteTable()[n];

      std::cout << "traces = " << qdp_index << "\n";

      for (int block = 0; block < 1; ++block)
      {
        std::cout << "block = " << block << "\n";

        for (int i = 0; i < 6; ++i)
        {
          double tmpreal;
          //tmpreal = eclov.tri_dia.elem(qdp_index).comp[block].diag[i].elem().elem(); 
          tmpreal = eclov.qc_t.elem(qdp_index).comp[block].diag[i].elem().elem();

          //tmpreal = eclov.qc.elem(qdp_index).comp[block].q[i].elem().elem();

          std::cout << tmpreal << "\t";

        }
        std::cout << "\n";
      }
    }
  }

  file_out.close();
  std::cout.rdbuf(original_buf);
}
#endif

void printLatticeFermion(const LatticeFermion& f, const std::string& filename = "")
{
    std::ostream& out = filename.empty() 
                        ? std::cout 
                        : *(new std::ofstream(filename));
    for (int cb = 0; cb < 2; ++cb)
    {
        const QDP::Subset& sub = QDP::rb[cb];
        int numSites = sub.siteTable().size();

        std::cout << "=== Checkerboard " << cb << " ===" << std::endl;

        for (int n = 0; n < numSites; ++n)
        {
            int qdp_index = sub.siteTable()[n];
            out << "--- Site " << qdp_index << " ---" << std::endl;

            for (int s = 0; s < 4; ++s){       // spin
                out << "s=" << s <<"\n";
                for (int c = 0; c < 3; ++c)   // color
                {
#if JIT
                    double re = f.elem(qdp_index).elem(s).elem(c).real().elem();
                    double im = f.elem(qdp_index).elem(s).elem(c).imag().elem();
#else
                    double re = f.elem(qdp_index).elem(s).elem(c).real();
                    double im = f.elem(qdp_index).elem(s).elem(c).imag();
#endif
                    out << re << "+" << im << "i  ";
                }
                out << "\n";
            }
        }
    }
}







int main(int argc, char *argv[])
{
  Chroma::initialize(&argc, &argv);
  const int nrow_in[4] = {2,2,4,4};
  multi1d<int> nrow(4);
  nrow = nrow_in;
  Layout::setLattSize(nrow);
  Layout::create();

  // ---- Gauge field ----

  struct Cfg_t config = { CFG_TYPE_SZINQIO, "/lustre/orion/scratch/mcamacho/stf006/exp_clover/test_outs/l2_2_4_4_Pure_gauge_128stps_test_cfg_1.lime" };
  multi1d<LatticeColorMatrix> u(Nd);
  XMLReader gauge_file_xml, gauge_xml;
  gaugeStartup(gauge_file_xml, gauge_xml, u, config);

  
  // ---- Boundary conditions ----
  multi1d<int> bcs(4);
  bcs[0] = bcs[1] = bcs[2] = 1;
  bcs[3] = -1;

 
  Handle<FermState<LatticeFermion,
                    multi1d<LatticeColorMatrix>,
                    multi1d<LatticeColorMatrix>>> 
    fermState(new SimpleFermState<LatticeFermion,
                                  multi1d<LatticeColorMatrix>,
                                  multi1d<LatticeColorMatrix>>(bcs, u));

  // ---- Clover parameters ----
  CloverFermActParams params;
  params.Mass = Real(0.1);
  params.clovCoeffR = 1.0;
  params.clovCoeffT = 1.0;
  params.u0 = 1.0;
  params.anisoParam.anisoP = false;
  params.anisoParam.t_dir = 3;
  params.anisoParam.xi_0 = Real(1.0);
  params.twisted_m = 0.0;
  params.twisted_m_usedP = false;

#if CLOVER
  params.stabilized_wilson = true; 
#endif


  // ---- Fermion fields ----
  LatticeFermion psi, chi;
  //gaussian(psi);

  readLatticeFermion(psi, "psi_fermion.txt");

  chi = zero;

#if CLOVER
  std::cout << "Using the clover stabilized version";
  // ---- Create ExpCloverTerm ----
  CloverTerm expClov;
  expClov.create(fermState, params);
#else
  // ---- Create ExpCloverTerm ----
  ExpCloverTerm expClov;
  expClov.create(fermState, params);
  std::cout << "Using the exp-clover version\n";
//  std::cout << "diag_mass = " <<expClov.diag_mass;

#endif    

  // ---- Apply exp-clover operator ----
  for (int cb = 0; cb < 2; ++cb) {
std::cout << "Volume = " << Layout::vol() << std::endl;
std::cout << "RB0 size = " << rb[0].siteTable().size() << std::endl;
std::cout << "RB1 size = " << rb[1].siteTable().size() << std::endl;
    expClov.apply(chi, psi, PLUS, cb);
  }

  //write_inv_clover_traces(expClov);


#if CLOVER
    std::string prefix="stabilized";
#else
    std::string prefix="exp-clover";
#endif

#if JIT
  prefix=prefix+"-jit";
#else
  prefix=prefix+"-qpdxx";
#endif
  std::string ferm_out=prefix+"_chi.txt";


  printLatticeFermion(chi,ferm_out);


  Chroma::finalize();
  return 0;
}

