// commandprocessor is the first logical gate our tool encounters,
// it provides utilities to  determine if we should go through standard initialization, or
// go through setup using the provided command flags.
package commandprocessor

import (
	"errors"
	"flag"
	"fmt"
	"os"

	"github.com/Linkinlog/assible/pkg/osHandler"
)

// ProcessCommand will start everything,
// handling the flags/args and processing.
func ProcessCommand() error {
	systemPtr := flag.String("system", "", "The target OS")
	flag.Parse()
	if len(os.Args) > 1 && os.Args[1] == "init" {
		return initTool()
	} else if *systemPtr != "" {
		var system, err = osHandler.StringToSystem(*systemPtr)
		if err != nil {
			return err
		}
		return startPipeline(system)
	} else {
		return errors.New("Invalid use of tool, please check `-h`")
	}
}

// initTool will collect options from the user
// and pass them along to the pipeline.
func initTool() error {
	var prompt string
	fmt.Print("Input OS(Win, Linux, Mac): ")
	fmt.Scanf("%s", &prompt)
	// Make a new os struct with the prompt.
	var system, err = osHandler.StringToSystem(prompt)
	if err != nil {
		return err
	}
	return startPipeline(system)
}

// startPipeline will take a look at what arguments were passed in
// and then begin setting up shop, starting with installing pacakages.
func startPipeline(system osHandler.System) error {
	// Pass along to installer service.
	return errors.New("TODO")
}
