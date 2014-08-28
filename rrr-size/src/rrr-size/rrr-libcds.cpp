/**
 * Generates a repeatable random bitmap.
 * 
 * Written by Andras Majdan
 * License: GNU General Public License Version 3
 * 
 * Report bugs to <majdan.andras@gmail.com>
 */

#include "rrr-libcds.hpp"

namespace rrr_size {
	
  std::string rrr_libcds::get_name() {
    return "libcds";
  }
	  
  void rrr_libcds::load_file(std::string filename, long len) {
    cds_utils::BitString bitstring(filename.c_str());
	bsrrr = new cds_static::BitSequenceRRR(bitstring,33);
  }
	  
  long rrr_libcds::get_size() {
    return bsrrr->getSize();
  }
	  
  void rrr_libcds::free_memory() {
    delete bsrrr;
  }

}
