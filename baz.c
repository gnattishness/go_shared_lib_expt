#include <stdio.h>

extern long long BarFunc();
extern long long FooFunc();
// extern long long InternalNameClash();

int main() {

    long long f = FooFunc();
    printf("Foo Result: %lld\n", f);
    long long b = BarFunc();
    printf("Bar Result: %lld\n", b);

    // Something that clashes - doesn't error for shared libs,
    // but picks 1 implementation
    //
    // InternalNameClash();
    return 0;
}
