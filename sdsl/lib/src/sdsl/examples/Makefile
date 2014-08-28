CC=g++
CC_FLAGS=-Wall -g -O3 -I/home/andras/rrr-size-vs-density/sdsl/lib/build/include -L/home/andras/rrr-size-vs-density/sdsl/lib/build/lib -DNDEBUG -funroll-loops -msse4.2
CCLIB=-lsdsl -ldivsufsort -ldivsufsort64 
SOURCES=$(wildcard *.cpp)
EXECS=$(SOURCES:.cpp=)

all: $(EXECS)
	        
%:%.cpp
	$(CC) $(CC_FLAGS) -o $@ $< $(CCLIB) 

clean:
	rm -f $(EXECS)

