/**
 * Generates a repeatable random bitmap.
 * 
 * Written by Andras Majdan
 * License: GNU General Public License Version 3
 * 
 * Report bugs to <majdan.andras@gmail.com>
 */

#include <iostream>
#include <string>
#include <exception>
#include <sys/stat.h>

#include "rrr-size/rrr-library.hpp"
#ifdef LIBCDS
#include "rrr-size/rrr-libcds.hpp"
#endif
#ifdef LIBCDS2
#include "rrr-size/rrr-libcds2.hpp"
#endif
#ifdef SDSL
#include "rrr-size/rrr-sdsl.hpp"
#endif
#ifdef SDSL_LITE
#include "rrr-size/rrr-sdsl-lite.hpp"
#endif

using namespace std;
using namespace rrr_size;

long get_file_size(string filename);
void print_usage(bool doexit, int exitcode);

int main(int argc, char *argv[]) {	
  rrr_library* rrr;

  if(argc<2)
    print_usage(true, 1);
  
  if(string(argv[1]) == "--help")
    print_usage(true, 0);
  
  string filename;
  long uncompressed;
  int i=0;
  
  cout << "Library\tUncompressed\tCompressed\tRatio\tFile\n";
  
  while(++i<argc) {
	
    filename = argv[i];
  
    try {
	  uncompressed = get_file_size(filename);
    }
    catch(string err) {
      cout << err << '\n';
      exit(1);	  
    }

#ifdef LIBCDS
    rrr = new rrr_libcds();
#endif
#ifdef LIBCDS2
    rrr = new rrr_libcds2();
#endif
#ifdef SDSL
    rrr = new rrr_sdsl();
#endif
#ifdef SDSL_LITE
    rrr = new rrr_sdsl_lite();
#endif
  
    long compressed;
    float ratio;
	
    cout << rrr->get_name() << "\t";
    cout << uncompressed << "\t";
	
    try {
      rrr->load_file(filename, uncompressed);
    }
    catch(string err) {
      cout << err << '\n';
      exit(1);	  
    } 
    
    compressed = rrr->get_size();
    cout << compressed << "\t";
    
    if(uncompressed == 0 || compressed == 0) {
	  cout << "Error: unexpected size\n";
	  exit(1);
    }

    ratio = (float)compressed/uncompressed;    
    cout << ratio << "\t";
	
    cout << filename << endl;
	
    rrr->free_memory();
  }
}

long get_file_size(string filename)
{
    struct stat stat_buf;
    int rc = stat(filename.c_str(), &stat_buf);
    
    if(rc == 0)
      return stat_buf.st_size;
    else 
      throw string("Error: could not determine size of file (maybe not exists)");
}

void print_usage(bool doexit, int exitcode) {

  cout << "Usage: rrr-size filename1 filename2 ..\n\n"
    "Calculates compressor efficiency\n\n"
    "Written by Andras Majdan\n"
	"License: GNU General Public License Version 3\n"
	"Report bugs to <majdan.andras@gmail.com>\n";

  if(doexit)
    exit(exitcode);
}
