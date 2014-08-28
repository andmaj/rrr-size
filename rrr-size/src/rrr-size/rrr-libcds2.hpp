/**
 * Generates a repeatable random bitmap.
 * 
 * Written by Andras Majdan
 * License: GNU General Public License Version 3
 * 
 * Report bugs to <majdan.andras@gmail.com>
 */

#include <string>

#include "rrr-library.hpp"

namespace rrr_size {
	
  class rrr_libcds2 : public rrr_library {
    public:
	  std::string get_name(); 
      void load_file(std::string filename, long len);
	  long get_size();
	  void free_memory();
  };

}
