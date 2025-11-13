
package main

import ( "log"; "time" )
func main(){
  for {
    log.Println("projector tick: simulate consuming events and updating read models...")
    time.Sleep(5*time.Second)
  }
}
