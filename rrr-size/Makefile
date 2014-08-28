all: rrr-size-sdsl-8 rrr-size-sdsl-16 rrr-size-sdsl-32 \
rrr-size-sdsl-64 rrr-size-sdsl-128 rrr-size-sdsl-256 \
rrr-size-sdsl-lite-8 rrr-size-sdsl-lite-16 rrr-size-sdsl-lite-32 \
rrr-size-sdsl-lite-64 rrr-size-sdsl-lite-128 rrr-size-sdsl-lite-256 \
rrr-size-libcds

rrr-size-sdsl-8: bin/rrr-size-sdsl-8

rrr-size-sdsl-16: bin/rrr-size-sdsl-16

rrr-size-sdsl-32: bin/rrr-size-sdsl-32

rrr-size-sdsl-64: bin/rrr-size-sdsl-64

rrr-size-sdsl-128: bin/rrr-size-sdsl-128

rrr-size-sdsl-256: bin/rrr-size-sdsl-256

rrr-size-sdsl-lite-8: bin/rrr-size-sdsl-lite-8

rrr-size-sdsl-lite-16: bin/rrr-size-sdsl-lite-16

rrr-size-sdsl-lite-32: bin/rrr-size-sdsl-lite-32

rrr-size-sdsl-lite-64: bin/rrr-size-sdsl-lite-64

rrr-size-sdsl-lite-128: bin/rrr-size-sdsl-lite-128

rrr-size-sdsl-lite-256: bin/rrr-size-sdsl-lite-256

rrr-size-libcds: bin/rrr-size-libcds-15

bin/rrr-size-sdsl-8:
	$(CC) -std=c++11 -O3 -lstdc++ -DSDSL -DBLOCK=8 -o bin/rrr-size-sdsl-8 \
-I../sdsl/lib/build/include -L../sdsl/lib/build/lib \
src/rrr-size.cpp src/rrr-size/rrr-sdsl.cpp -lsdsl -ldivsufsort -ldivsufsort64

bin/rrr-size-sdsl-16:
	$(CC) -std=c++11 -O3 -lstdc++ -DSDSL -DBLOCK=16 -o bin/rrr-size-sdsl-16 \
-I../sdsl/lib/build/include -L../sdsl/lib/build/lib \
src/rrr-size.cpp src/rrr-size/rrr-sdsl.cpp -lsdsl -ldivsufsort -ldivsufsort64

bin/rrr-size-sdsl-32:
	$(CC) -std=c++11 -O3 -lstdc++ -DSDSL -DBLOCK=32 -o bin/rrr-size-sdsl-32 \
-I../sdsl/lib/build/include -L../sdsl/lib/build/lib \
src/rrr-size.cpp src/rrr-size/rrr-sdsl.cpp -lsdsl -ldivsufsort -ldivsufsort64

bin/rrr-size-sdsl-64:
	$(CC) -std=c++11 -O3 -lstdc++ -DSDSL -DBLOCK=64 -o bin/rrr-size-sdsl-64 \
-I../sdsl/lib/build/include -L../sdsl/lib/build/lib \
src/rrr-size.cpp src/rrr-size/rrr-sdsl.cpp -lsdsl -ldivsufsort -ldivsufsort64

bin/rrr-size-sdsl-128:
	$(CC) -std=c++11 -O3 -lstdc++ -DSDSL -DBLOCK=128 -o bin/rrr-size-sdsl-128 \
-I../sdsl/lib/build/include -L../sdsl/lib/build/lib \
src/rrr-size.cpp src/rrr-size/rrr-sdsl.cpp -lsdsl -ldivsufsort -ldivsufsort64

bin/rrr-size-sdsl-256:
	$(CC) -std=c++11 -O3 -lstdc++ -DSDSL -DBLOCK=256 -o bin/rrr-size-sdsl-256 \
-I../sdsl/lib/build/include -L../sdsl/lib/build/lib \
src/rrr-size.cpp src/rrr-size/rrr-sdsl.cpp -lsdsl -ldivsufsort -ldivsufsort64

bin/rrr-size-sdsl-lite-8:
	$(CC) -std=c++11 -O3 -lstdc++ -DSDSL_LITE -DBLOCK=8 -o bin/rrr-size-sdsl-lite-8 \
-I../sdsl-lite/lib/build/include -L../sdsl-lite/lib/build/lib \
src/rrr-size.cpp src/rrr-size/rrr-sdsl-lite.cpp -lsdsl -ldivsufsort -ldivsufsort64

bin/rrr-size-sdsl-lite-16:
	$(CC) -std=c++11 -O3 -lstdc++ -DSDSL_LITE -DBLOCK=16 -o bin/rrr-size-sdsl-lite-16 \
-I../sdsl-lite/lib/build/include -L../sdsl-lite/lib/build/lib \
src/rrr-size.cpp src/rrr-size/rrr-sdsl-lite.cpp -lsdsl -ldivsufsort -ldivsufsort64

bin/rrr-size-sdsl-lite-32:
	$(CC) -std=c++11 -O3 -lstdc++ -DSDSL_LITE -DBLOCK=32 -o bin/rrr-size-sdsl-lite-32 \
-I../sdsl-lite/lib/build/include -L../sdsl-lite/lib/build/lib \
src/rrr-size.cpp src/rrr-size/rrr-sdsl-lite.cpp -lsdsl -ldivsufsort -ldivsufsort64

bin/rrr-size-sdsl-lite-64:
	$(CC) -std=c++11 -O3 -lstdc++ -DSDSL_LITE -DBLOCK=64 -o bin/rrr-size-sdsl-lite-64 \
-I../sdsl-lite/lib/build/include -L../sdsl-lite/lib/build/lib \
src/rrr-size.cpp src/rrr-size/rrr-sdsl-lite.cpp -lsdsl -ldivsufsort -ldivsufsort64

bin/rrr-size-sdsl-lite-128:
	$(CC) -std=c++11 -O3 -lstdc++ -DSDSL_LITE -DBLOCK=128 -o bin/rrr-size-sdsl-lite-128 \
-I../sdsl-lite/lib/build/include -L../sdsl-lite/lib/build/lib \
src/rrr-size.cpp src/rrr-size/rrr-sdsl-lite.cpp -lsdsl -ldivsufsort -ldivsufsort64

bin/rrr-size-sdsl-lite-256:
	$(CC) -std=c++11 -O3 -lstdc++ -DSDSL_LITE -DBLOCK=256 -o bin/rrr-size-sdsl-lite-256 \
-I../sdsl-lite/lib/build/include -L../sdsl-lite/lib/build/lib \
src/rrr-size.cpp src/rrr-size/rrr-sdsl-lite.cpp -lsdsl -ldivsufsort -ldivsufsort64

bin/rrr-size-libcds-15:
	$(CC) -std=c++11 -O3 -lstdc++ -DLIBCDS -o bin/rrr-size-libcds-15 \
-I../libcds/lib/build/include -L../libcds/lib/build/lib \
src/rrr-size.cpp src/rrr-size/rrr-libcds.cpp -lcds

clean:
	rm -f bin/rrr-size-sdsl*
	rm -f bin/rrr-size-libcds*
