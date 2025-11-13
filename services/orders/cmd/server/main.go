
package main

import (
  "encoding/json"
  "log"
  "math/rand"
  "net/http"
  "os"
  "time"
  "orderssvc/internal/domain"
)

type createOrderReq struct { TenantID, OrderID, Currency string; TotalAmount float64 }
type orderView struct { OrderID, TenantID, Status, Currency string; TotalAmount float64 }

var store = map[string]orderView{}

func main(){
  mux := http.NewServeMux()
  mux.HandleFunc("/health", func(w http.ResponseWriter, r *http.Request){ w.Write([]byte("ok")) })
  mux.HandleFunc("/orders", func(w http.ResponseWriter, r *http.Request){
    if r.Method != http.MethodPost { w.WriteHeader(405); return }
    var req createOrderReq
    if err := json.NewDecoder(r.Body).Decode(&req); err != nil { http.Error(w, err.Error(), 400); return }
    if req.OrderID == "" { req.OrderID = randID() }
    agg := &domain.Order{}
    evts, err := agg.HandleCreate(domain.CmdCreate{ TenantID:req.TenantID, ID:req.OrderID, Currency:req.Currency, TotalAmount:req.TotalAmount })
    if err != nil { http.Error(w, err.Error(), 409); return }
    for _, e := range evts { agg.Apply(e) }
    store[agg.ID] = orderView{ OrderID: agg.ID, TenantID: agg.TenantID, Status: string(agg.Status), Currency: agg.Currency, TotalAmount: agg.TotalAmount }
    json.NewEncoder(w).Encode(map[string]any{ "orderId": agg.ID, "status":"ACCEPTED" })
  })
  mux.HandleFunc("/orders/", func(w http.ResponseWriter, r *http.Request){
    id := r.URL.Path[len("/orders/"):]
    v, ok := store[id]; if !ok { http.NotFound(w,r); return }
    json.NewEncoder(w).Encode(v)
  })
  addr := ":" + getenv("PORT","8080")
  log.Printf("orders listening on %s", addr)
  http.ListenAndServe(addr, mux)
}
func randID() string {
  rand.Seed(time.Now().UnixNano())
  alphabet := []rune("abcdef0123456789")
  b := make([]rune, 16)
  for i := range b { b[i] = alphabet[rand.Intn(len(alphabet))] }
  return string(b)
}
func getenv(k, d string) string { if v:=os.Getenv(k); v!=""{return v}; return d }
