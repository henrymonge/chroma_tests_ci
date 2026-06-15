// ChatGPT code compare_props_from_files.cc
//
// Read propagator file paths from command-line arguments and compare them.
// Usage:
//   compare_props_from_files <prop_jit.lime> <prop_swf.lime>

#include "chromabase.h"
#include "chroma.h"
#include <iostream>
#include <string>

using namespace Chroma;
using namespace QDP;


int main(int argc, char** argv)
{
  Chroma::initialize(&argc, &argv);

/*
  if (argc != 3) {
    QDPIO::cerr << "Usage: " << argv[0]
                << " prop_A prop_B\n";
    Chroma::finalize();
    return 1;
  }
*/

  QDPIO::cout << argv[argc -1] << "\n" << argv[argc -2] << "\n";
  Chroma::finalize();
  return 0;
}

