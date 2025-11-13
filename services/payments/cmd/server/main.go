
package main

import (
  "encoding/json"
  "log"
  "net/http"
  "os"
)

type payReq struct { OrderID, TenantID string; Amount float64; Currency string }

func main(){
  mux := http.NewServeMux()
  mux.HandleFunc("/health", func(w http.ResponseWriter, r *http.Request){ w.Write([]byte("ok")) })
  mux.HandleFunc("/pay", func(w http.ResponseWriter, r *http.Request){
    var req payReq; json.NewDecoder(r.Body).Decode(&req)
    log.Printf("simulate payment for %s tenant %s amount %.2f %s", req.OrderID, req.TenantID, req.Amount, req.Currency)
    json.NewEncoder(w).Encode(map[string]any{ "ok": true, "providerRef": "sim-"+req.OrderID })
  })
  addr := ":" + getenv("PORT","8080")
  log.Printf("payments listening on %s", addr)
  http.ListenAndServe(addr, mux)
}
func getenv(k, d string) string { if v:=os.Getenv(k); v!=""{return v}; return d }
