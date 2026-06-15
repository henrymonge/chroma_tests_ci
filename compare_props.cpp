// compare_props.cpp
//
// Read N propagator files from command-line arguments and compare all pairs.
// Usage:
//   compare_props <prop_A.lime> <prop_B.lime> [<prop_C.lime> ...]
//
// For each pair (i,j) reports:
//   ||Pi||, ||Pi - Pj||, relative difference, and per-timeslice relative diff.
//
// Fixes bugs in prop_comparison.cpp:
//   - both reads used prop_file_B instead of prop_file_A / prop_file_B
//   - comparison was B vs B instead of A vs B

#include "chromabase.h"
#include "chroma.h"
#include <iostream>
#include <string>
#include <vector>
#include <iomanip>

using namespace Chroma;
using namespace QDP;

// Return the basename (last component after '/') of a file path.
static std::string basename(const std::string& path)
{
  size_t pos = path.rfind('/');
  return (pos == std::string::npos) ? path : path.substr(pos + 1);
}

// Read a propagator from a LIME file.
static void readProp(LatticePropagator& prop, const std::string& filename)
{
  XMLReader file_xml, record_xml;
  readQprop(file_xml, record_xml, prop, filename, QDPIO_SERIAL);
}

// Compare two propagators and print statistics including per-timeslice breakdown.
static void comparePair(const LatticePropagator& PA,
                        const LatticePropagator& PB,
                        const std::string& nameA,
                        const std::string& nameB,
                        double tol = 1.0e-6)
{
  QDPIO::cout << "\n";
  QDPIO::cout << "============================================================\n";
  QDPIO::cout << "Comparing:\n";
  QDPIO::cout << "  A = " << nameA << "\n";
  QDPIO::cout << "  B = " << nameB << "\n";
  QDPIO::cout << "------------------------------------------------------------\n";

  LatticePropagator diff = PA - PB;

  Double normA  = sqrt(norm2(PA));
  Double normB  = sqrt(norm2(PB));
  Double normD  = sqrt(norm2(diff));
  Double relD   = normD / normA;

  QDPIO::cout << std::scientific << std::setprecision(6);
  QDPIO::cout << "  ||A||         = " << normA << "\n";
  QDPIO::cout << "  ||B||         = " << normB << "\n";
  QDPIO::cout << "  ||A - B||     = " << normD << "\n";
  QDPIO::cout << "  rel diff      = " << relD  << "\n";

  // Per-timeslice breakdown
  int Lt = Layout::lattSize()[3];
  QDPIO::cout << "\n  Per-timeslice relative difference:\n";
  QDPIO::cout << "  t   ||A_t||          ||A_t - B_t||    rel_t\n";
  QDPIO::cout << "  ---  ---------------  ---------------  ---------------\n";

  bool any_failed = false;
  for (int t = 0; t < Lt; ++t)
  {
    // time-slice subset
    LatticeBoolean tslice_mask = (Layout::latticeCoordinate(3) == t);

    Double nA_t  = sqrt(norm2(PA,   tslice_mask));
    Double nD_t  = sqrt(norm2(diff, tslice_mask));
    Double rel_t = (toDouble(nA_t) > 0.0) ? nD_t / nA_t : Double(0.0);

    QDPIO::cout << "  " << std::setw(3) << t
                << "  " << std::setw(15) << nA_t
                << "  " << std::setw(15) << nD_t
                << "  " << std::setw(15) << rel_t << "\n";

    if (toDouble(rel_t) > tol)
      any_failed = true;
  }

  QDPIO::cout << "\n";
  if (toDouble(relD) > tol || any_failed)
    QDPIO::cout << "  RESULT: FAILED (relative difference exceeds tolerance " << tol << ")\n";
  else
    QDPIO::cout << "  RESULT: PASSED\n";

  QDPIO::cout << "============================================================\n";
}

int main(int argc, char** argv)
{
  Chroma::initialize(&argc, &argv);

  if (argc < 3) {
    QDPIO::cerr << "Usage: " << argv[0] << " prop_A prop_B [prop_C ...]\n";
    Chroma::finalize();
    return 1;
  }

  int nprops = argc - 1;
  std::vector<std::string> filenames(nprops);
  for (int i = 0; i < nprops; ++i)
    filenames[i] = argv[i + 1];

  // Read all propagators
  std::vector<LatticePropagator> props(nprops);
  for (int i = 0; i < nprops; ++i)
  {
    QDPIO::cout << "Reading propagator " << i << ": " << filenames[i] << " ...\n";
    readProp(props[i], filenames[i]);
    QDPIO::cout << "  done.\n";
  }

  // Compare all pairs
  for (int i = 0; i < nprops; ++i)
    for (int j = i + 1; j < nprops; ++j)
      comparePair(props[i], props[j],
                  basename(filenames[i]),
                  basename(filenames[j]));

  Chroma::finalize();
  return 0;
}
