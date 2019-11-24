An experiment with with Golang shared libraries and C

## Usage

```console
$ make
$ ./baz
Hello Foo!
Foo Result: 1
Hello Bar!
Bar Result: 2
```

Change `BUILDMODE` in [Makefile](./Makefile) to `c-archive` to try making static libraries.

Can check what symbols are exported/externally visible like so:

```console
$ nm --extern-only bar.so
```

## Findings

Can we use shared/dynamic libraries where some of the symbols are redefined?

**Answer:**

Yes! There will be no problem as long as the externally visible symbols we are using don't have name clashes.

If there is a name clash, only 1 implementation will be called, but it may still run.

----

TODO - what about where those libraries depend on another shared library that clashes?

### Resources

- https://github.com/vladimirvivien/go-cshared-examples
- https://www.cprogramming.com/tutorial/shared-libraries-linux-gcc.html
- https://golang.org/cmd/go/
- https://golang.org/cmd/cgo/
