// Assible 0.1
// Written by Dahlton
// https://github.com/Linkinlog

// Assible_config aims to assist in automating setting up
// a local development environment by making or using
// a bare Git repository and Git submodules to manage
// dotfiles in an organized and effective manner

// Command usage:
// `ass init`
// Available options:
// `--system`        The operating system you are configuring (see "supported systems")
// More to come
// TODO

// Assible contains utilities for automating dev setup.
// Check out https://github.com/Linkinlog/assible for more
package main

import commandprocessor "github.com/Linkinlog/assible/pkg/commandProcessor"

// main starts everything off, starting with our command processor.
func main() {
	commandprocessor.ProcessCommand()
}
