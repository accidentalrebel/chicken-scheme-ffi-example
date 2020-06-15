all:
	chicken-csc ffi.c -cxx gcc ffi.scm -o output
	./output
