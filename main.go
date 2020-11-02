package main

import (
	"log"
	"os"
)

func main() {
	args := os.Args[1:]
	if len(args) != 1 {
		log.Fatal("Expecting argument: Path to a file containing an ASCII diagram.")
	}

	file, err := os.Open(args[0])

	if err != nil {
		log.Fatal(err)
	}

	ASCIItoSVG(file, os.Stdout)
}
