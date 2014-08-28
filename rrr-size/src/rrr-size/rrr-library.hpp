/**
 * Generates a repeatable random bitmap.
 * 
 * Written by Andras Majdan
 * License: GNU General Public License Version 3
 * 
 * Report bugs to <majdan.andras@gmail.com>
 */

#ifndef RRR_LIBRARY_HPP

#include <string>

namespace rrr_size {
	
  class rrr_library {
    public:
	  virtual std::string get_name() = 0;
      virtual void load_file(std::string filename, long len) = 0;
	  virtual long get_size() = 0;	
	  virtual void free_memory() = 0;
  };
  
}

#define RRR_LIBRARY_HPP
#endif
