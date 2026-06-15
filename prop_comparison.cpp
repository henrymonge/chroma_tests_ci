// ChatGPT code compare_props_from_files.cc
//
// Read propagator file paths from command-line arguments and compare them.
// Usage:
//   compare_props_from_files <prop_jit.lime> <prop_swf.lime>

#include "chromabase.h"
#include "chroma.h"
#include <iostream>
#include <string>
#include <regex>

using namespace Chroma;
using namespace QDP;

#include <vector>

std::vector<std::string> split(const std::string& str) {

    std::regex re("[, ]+");
    std::sregex_token_iterator it(str.begin(), str.end(), re, -1);
    std::sregex_token_iterator end;
    std::vector<std::string> result(it, end);

    return result;
}


void comparePropagators(const LatticePropagator& P1,
                         const LatticePropagator& P2,
                         double tol = 1.0e-14)
{
  LatticePropagator diff = P1 - P2;

  Double nref  = sqrt(norm2(P1));
  Double ndiff = sqrt(norm2(diff));
  Double rel   = ndiff / nref;

  QDPIO::cout << "||P1||        = " << nref  << "\n";
  QDPIO::cout << "||P1-P2||     = " << ndiff << "\n";
  QDPIO::cout << "relative diff = " << rel   << "\n";

  if (toDouble(rel) > tol) {
    QDPIO::cout << "FAILED: difference exceeds tolerance\n";
  } else {
    QDPIO::cout << "PASSED\n";
  }
}

void printLatticeFermion(const LatticePropagator& f, const std::string& filename = "")
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
                    double re = f.elem(qdp_index).elem(s,0).elem(c,0).real().elem();
                    double im = f.elem(qdp_index).elem(s,0).elem(c,0).imag().elem();
#else
                    double re = f.elem(qdp_index).elem(s,0).elem(c,0).real().elem();
                    double im = f.elem(qdp_index).elem(s,0).elem(c,0).imag().elem();
#endif
                    out << re << "+" << im << "i  ";
                }
                out << "\n";
            }
        }
    }
}



int main(int argc, char** argv)
{
  Chroma::initialize(&argc, &argv);

  // Fix 1: set up the lattice layout before declaring any lattice objects
  multi1d<int> nrow(4);
  nrow[0] = std::atoi(argv[1]);
  nrow[1] = std::atoi(argv[2]);
  nrow[2] = std::atoi(argv[3]);
  nrow[3] = std::atoi(argv[4]);
  Layout::setLattSize(nrow);
  Layout::create();

  
  std::string prop_path = std::string(argv[argc -3]);
  std::string prop_file_A = prop_path+std::string(argv[argc -1])+".lime";
  std::string prop_file_B = prop_path+std::string(argv[argc -2])+".lime";

  QDPIO::cout << prop_path <<"\n";

  QDPIO::cout << "argc=" << argc <<"\n";

  QDPIO::cout << prop_file_A << "\n" << prop_file_B <<"\n";

  if (argc != 13) {
    QDPIO::cerr << "Usage: " << argv[0]
                << " prop_A prop_B\n";
    Chroma::finalize();
    return 1;
  }

  LatticePropagator quark_propagator_A;
  LatticePropagator quark_propagator_B;

  quark_propagator_A = zero;   

  XMLReader prop_file_xml;
  XMLReader prop_record_xml;

  readQprop(prop_file_xml,
            prop_record_xml,
            quark_propagator_A,
            prop_file_B,
            QDPIO_SERIAL);

  readQprop(prop_file_xml,
            prop_record_xml,
            quark_propagator_B,
            prop_file_B,
            QDPIO_SERIAL);
 
  //quark_propagator_B = zero;
  //quark_propagator_A = zero; 
  comparePropagators(quark_propagator_A,
                     quark_propagator_B);

  auto qpropA = std::string(argv[argc -1])+".txt";
  auto qpropB = std::string(argv[argc -2])+".txt";


  std::cout<<  qpropA << "\n";
  std::cout<<  qpropB << "\n";
 
  printLatticeFermion(quark_propagator_A,qpropA);
  printLatticeFermion(quark_propagator_B,qpropB);


  Chroma::finalize();
  return 0;
}

