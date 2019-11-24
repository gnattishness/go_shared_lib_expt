package main

import "C"

import "fmt"

//export FooFunc
func FooFunc() int {
    return InternalNameClash()
}

// If you want an exported name clash add this //export InternalNameClash
func InternalNameClash() int {
    fmt.Printf("Hello Foo!\n")
    return 1
}

func main() {}
