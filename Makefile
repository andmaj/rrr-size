MAKEFILE_PATH := $(abspath $(lastword $(MAKEFILE_LIST)))
MAKEDIR := $(patsubst %/,%,$(dir $(MAKEFILE_PATH)))

LIBCDS_SRC=$(MAKEDIR)/libcds/lib/src/libcds
LIBCDS_BUILD=$(MAKEDIR)/libcds/lib/build

SDSL_DIR=$(MAKEDIR)/sdsl
SDSL_SRC=$(MAKEDIR)/sdsl/lib/src/sdsl
SDSL_BUILD=$(MAKEDIR)/sdsl/lib/build

SDSL_LITE_SRC=$(MAKEDIR)/sdsl-lite/lib/src/sdsl-lite
SDSL_LITE_BUILD=$(MAKEDIR)/sdsl-lite/lib/build

RANDBITMAPDIR=$(MAKEDIR)/randbitmap
BITMAPSDIR=$(MAKEDIR)/bitmaps

BITMAP_SEED=1234
BITMAP_SIZE=419430400

RRR_SIZE_DIR=$(MAKEDIR)/rrr-size

RESULTS=$(MAKEDIR)/results

all: libcds sdsl sdsl-lite randbitmap rrr-size

libcds: libcds-build

sdsl: sdsl-build

sdsl-lite: sdsl-lite-build

randbitmap: randbitmap-build randbitmap-generate

rrr-size: rrr-size-build

rrr-size-build:
	(cd $(RRR_SIZE_DIR); make)

libcds-build:
	(cd $(LIBCDS_SRC); ./configure --prefix=$(LIBCDS_BUILD) && make && make install)

sdsl-build:
	(cd $(SDSL_SRC); find $(SDSL_DIR) -name 'CMakeCache.txt' -exec rm {} \+; ./install.sh $(SDSL_BUILD))

sdsl-lite-build:
	(cd $(SDSL_LITE_SRC); ./install.sh $(SDSL_LITE_BUILD))

randbitmap-build: $(RANDBITMAPDIR)/bin/randbitmap

$(RANDBITMAPDIR)/bin/randbitmap:
	(cd $(RANDBITMAPDIR); make)

randbitmap-generate: randbitmap-build bitmaps

bitmaps: $(BITMAPSDIR)/bits01 $(BITMAPSDIR)/bits0075 $(BITMAPSDIR)/bits005 \
$(BITMAPSDIR)/bits0025 $(BITMAPSDIR)/bits001 $(BITMAPSDIR)/bits0001 \
$(BITMAPSDIR)/bits00001 $(BITMAPSDIR)/bits000001 $(BITMAPSDIR)/bits0000001

$(BITMAPSDIR)/bits01:
	$(RANDBITMAPDIR)/bin/randbitmap $(BITMAP_SEED) 0.1 $(BITMAP_SIZE) $(BITMAPSDIR)/bits01
	
$(BITMAPSDIR)/bits0075:
	$(RANDBITMAPDIR)/bin/randbitmap $(BITMAP_SEED) 0.075 $(BITMAP_SIZE) $(BITMAPSDIR)/bits0075
	
$(BITMAPSDIR)/bits005:
	$(RANDBITMAPDIR)/bin/randbitmap $(BITMAP_SEED) 0.05 $(BITMAP_SIZE) $(BITMAPSDIR)/bits005
	
$(BITMAPSDIR)/bits0025:
	$(RANDBITMAPDIR)/bin/randbitmap $(BITMAP_SEED) 0.025 $(BITMAP_SIZE) $(BITMAPSDIR)/bits0025

$(BITMAPSDIR)/bits001:
	$(RANDBITMAPDIR)/bin/randbitmap $(BITMAP_SEED) 0.01 $(BITMAP_SIZE) $(BITMAPSDIR)/bits001

$(BITMAPSDIR)/bits0001:
	$(RANDBITMAPDIR)/bin/randbitmap $(BITMAP_SEED) 0.001 $(BITMAP_SIZE) $(BITMAPSDIR)/bits0001

$(BITMAPSDIR)/bits00001:
	$(RANDBITMAPDIR)/bin/randbitmap $(BITMAP_SEED) 0.0001 $(BITMAP_SIZE) $(BITMAPSDIR)/bits00001

$(BITMAPSDIR)/bits000001:
	$(RANDBITMAPDIR)/bin/randbitmap $(BITMAP_SEED) 0.00001 $(BITMAP_SIZE) $(BITMAPSDIR)/bits000001
	
$(BITMAPSDIR)/bits0000001:
	$(RANDBITMAPDIR)/bin/randbitmap $(BITMAP_SEED) 0.000001 $(BITMAP_SIZE) $(BITMAPSDIR)/bits0000001

run:
	(cd $(BITMAPSDIR); $(RRR_SIZE_DIR)/bin/rrr-size-sdsl-8 `cat bitmaps.lst` > $(RESULTS)/sdsl-8.txt)
	(cd $(BITMAPSDIR); $(RRR_SIZE_DIR)/bin/rrr-size-sdsl-16 `cat bitmaps.lst` > $(RESULTS)/sdsl-16.txt)
	(cd $(BITMAPSDIR); $(RRR_SIZE_DIR)/bin/rrr-size-sdsl-32 `cat bitmaps.lst` > $(RESULTS)/sdsl-32.txt)
	(cd $(BITMAPSDIR); $(RRR_SIZE_DIR)/bin/rrr-size-sdsl-64 `cat bitmaps.lst` > $(RESULTS)/sdsl-64.txt)
	(cd $(BITMAPSDIR); $(RRR_SIZE_DIR)/bin/rrr-size-sdsl-128 `cat bitmaps.lst` > $(RESULTS)/sdsl-128.txt)
	(cd $(BITMAPSDIR); $(RRR_SIZE_DIR)/bin/rrr-size-sdsl-256 `cat bitmaps.lst` > $(RESULTS)/sdsl-256.txt)
	(cd $(BITMAPSDIR); $(RRR_SIZE_DIR)/bin/rrr-size-sdsl-lite-8 `cat bitmaps.lst` > $(RESULTS)/sdsl-lite-8.txt)
	(cd $(BITMAPSDIR); $(RRR_SIZE_DIR)/bin/rrr-size-sdsl-lite-16 `cat bitmaps.lst` > $(RESULTS)/sdsl-lite-16.txt)
	(cd $(BITMAPSDIR); $(RRR_SIZE_DIR)/bin/rrr-size-sdsl-lite-32 `cat bitmaps.lst` > $(RESULTS)/sdsl-lite-32.txt)
	(cd $(BITMAPSDIR); $(RRR_SIZE_DIR)/bin/rrr-size-sdsl-lite-64 `cat bitmaps.lst` > $(RESULTS)/sdsl-lite-64.txt)
	(cd $(BITMAPSDIR); $(RRR_SIZE_DIR)/bin/rrr-size-sdsl-lite-128 `cat bitmaps.lst` > $(RESULTS)/sdsl-lite-128.txt)
	(cd $(BITMAPSDIR); $(RRR_SIZE_DIR)/bin/rrr-size-sdsl-lite-256 `cat bitmaps.lst` > $(RESULTS)/sdsl-lite-256.txt)
	(cd $(BITMAPSDIR); LD_PRELOAD=$(LIBCDS_BUILD)/lib/libcds.so.1 $(RRR_SIZE_DIR)/bin/rrr-size-libcds-15 `cat bitmaps.lst` > $(RESULTS)/libcds-15.txt)
	(cd $(RESULTS); $(RRR_SIZE_DIR)/genplotdata.sh; gnuplot $(RRR_SIZE_DIR)/plot.cmd)

clean:
	# Verbosity for safety!
	rm -f $(BITMAPSDIR)/bits01
	rm -f $(BITMAPSDIR)/bits0075
	rm -f $(BITMAPSDIR)/bits005
	rm -f $(BITMAPSDIR)/bits0025
	rm -f $(BITMAPSDIR)/bits001
	rm -f $(BITMAPSDIR)/bits0001
	rm -f $(BITMAPSDIR)/bits00001
	rm -f $(BITMAPSDIR)/bits000001
	rm -f $(BITMAPSDIR)/bits0000001
	rm -rf $(LIBCDS_BUILD)/include
	rm -rf $(LIBCDS_BUILD)/lib/pkgconfig
	rm -f $(LIBCDS_BUILD)/lib/libcds*
	if [ -d $(LIBCDS_BUILD)/lib ]; then rmdir $(LIBCDS_BUILD)/lib; fi;
	rm -rf $(SDSL_BUILD)/include
	rm -rf $(SDSL_BUILD)/lib/pkgconfig
	rm -f $(SDSL_BUILD)/lib/libsdsl*
	rm -f $(SDSL_BUILD)/lib/libgtest*
	rm -f $(SDSL_BUILD)/lib/libdivsufsort*
	if [ -d $(SDSL_BUILD)/lib ]; then rmdir $(SDSL_BUILD)/lib; fi;
	rm -rf $(SDSL_LITE_BUILD)/include
	rm -f $(SDSL_LITE_BUILD)/lib/libsdsl*
	rm -f $(SDSL_LITE_BUILD)/lib/libdivsufsort*
	if [ -d $(SDSL_LITE_BUILD)/lib ]; then rmdir $(SDSL_LITE_BUILD)/lib; fi;
	rm -f $(RANDBITMAPDIR)/bin/randbitmap
	rm -f $(BITMAPSDIR)/bits0*
	rm -f $(RRR_SIZE_DIR)/bin/rrr-size-*
	rm -f $(RESULTS)/sdsl*
	rm -f $(RESULTS)/libcds*
	rm -f $(RESULTS)/plot.dat
	rm -f $(RESULTS)/plot.png
