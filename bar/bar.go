package main

import "C"

import "fmt"

//export BarFunc
func BarFunc() int {
    return InternalNameClash()
}

// If you want an exported name clash add this //export InternalNameClash
func InternalNameClash() int {
    fmt.Printf("Hello Bar!\n")
    return 2
}

func main() {}
