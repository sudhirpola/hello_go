package main

import (
	"fmt"
	"strings"

	"github.com/atomix/dazl"
	_ "github.com/atomix/dazl/zap" // or another backend like "zerolog"
)

var log = dazl.GetLogger()
var utilsLog = dazl.GetLogger().WithSkipCalls(1)

// LogActivity logs activity of user
func LogActivity(verb string, thing string, args ...string) {
	utilsLog.Infof("UtilsLog %s %s %s", verb, thing, strings.Join(args, "/"))
}

func main() {
	log.Info("Application started")
	// Example of structured logging:
	log.Warnw("Configuration file not found; using defaults", dazl.String("file", "config.yaml"))
	// For demonstration, creating a sample error:
	err := fmt.Errorf("connection refused")
	log.Errorw("Failed to connect to database", dazl.String("db", "userdb"), dazl.Error(err))
	LogActivity("List Deployments", "ADM")
}
