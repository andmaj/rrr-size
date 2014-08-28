/**
 * Generates a repeatable random bitmap.
 * 
 * Written by Andras Majdan
 * License: GNU General Public License Version 3
 * 
 * Report bugs to <majdan.andras@gmail.com>
 */

#include <string>

#include "sdsl/int_vector.hpp"
#include "sdsl/rrr_vector.hpp"

#include "rrr-library.hpp"

namespace rrr_size {
	
  class rrr_sdsl_lite : public rrr_library {
	private:
      sdsl::rrr_vector<BLOCK> *rv;
    public:
	  std::string get_name();
      void load_file(std::string filename, long len);
	  long get_size();
	  void free_memory();
  };

}
