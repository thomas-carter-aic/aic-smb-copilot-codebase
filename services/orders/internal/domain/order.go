
package domain

import "errors"

type Status string
const (
  StatusCreated Status = "CREATED"
  StatusPaid Status = "PAID"
  StatusFulfilled Status = "FULFILLED"
  StatusCancelled Status = "CANCELLED"
)

type Order struct {
  TenantID string
  ID string
  Currency string
  TotalAmount float64
  Status Status
  Version int64
}

type CmdCreate struct { TenantID, ID, Currency string; TotalAmount float64 }
type Evt interface{ isEvent() }
type OrderCreated struct { TenantID, ID, Currency string; TotalAmount float64; Version int64 }
func (OrderCreated) isEvent() {}

func (o *Order) Apply(e Evt){
  switch ev := e.(type){
  case OrderCreated:
    o.TenantID = ev.TenantID; o.ID = ev.ID; o.Currency = ev.Currency; o.TotalAmount = ev.TotalAmount; o.Status = StatusCreated; o.Version = ev.Version
  }
}
func (o *Order) HandleCreate(c CmdCreate)([]Evt, error){
  if o.Version != 0 { return nil, errors.New("already exists") }
  return []Evt{ OrderCreated{ TenantID:c.TenantID, ID:c.ID, Currency:c.Currency, TotalAmount:c.TotalAmount, Version:1 } }, nil
}
