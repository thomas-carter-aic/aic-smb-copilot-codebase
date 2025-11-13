# Event Naming & Evolution

- Past‑tense domain names: `OrderCreated`, `PaymentSucceeded`.
- Envelope includes `tenant_id`, `aggregate_id`, `version`, correlation/causation.
- **Evolution**: additive fields; Protobuf **`reserved`** on removals; new event types for semantic changes.
