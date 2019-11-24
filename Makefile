CC := clang

# Not seeing any docs saying that cgo requires pthread, but it does?
CCFLAGS += -pthread

BUILDMODE := c-shared

default: baz

foo.so : foo/foo.go
	go build -o foo.so -buildmode=$(BUILDMODE) foo/foo.go

bar.so : bar/bar.go
	go build -o bar.so -buildmode=$(BUILDMODE) bar/bar.go 

baz.o : baz.c
	$(CC) $(CCFLAGS) -c baz.c -o baz.o

baz : baz.o bar.so foo.so
	# NOTE .so files are actually archives when BUILDMODE = c-archive
	$(CC) $(CCFLAGS) baz.o $(LDFLAGS) -o baz ./foo.so ./bar.so

clean:
	-rm -f *.o *.a *.so
	-rm -f baz bar.h foo.h
