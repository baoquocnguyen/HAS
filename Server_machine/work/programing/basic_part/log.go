package main

import (
	"log"


)

func main() {

	log.Print("[DEBUG] Debugging") // this will not print
	log.Print("[WARN] Warning") // this will
	log.Print("[ERROR] Erring") // and so will this
	log.Print("Message I haven't updated") // and so will this
}
