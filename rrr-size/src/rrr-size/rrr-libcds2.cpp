/**
 * Generates a repeatable random bitmap.
 * 
 * Written by Andras Majdan
 * License: GNU General Public License Version 3
 * 
 * Report bugs to <majdan.andras@gmail.com>
 */

#include "rrr-libcds2.hpp"

namespace rrr_size {
	
  std::string rrr_libcds2::get_name() {
    return "libcds2";
  }
	  
  void rrr_libcds2::load_file(std::string filename, long len) {
    ;
  }
	  
  long rrr_libcds2::get_size() {
    return 2;
  }
	  
  void rrr_libcds2::free_memory() {
    ;
  }

}
