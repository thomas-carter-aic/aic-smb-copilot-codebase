# Eventing: CQRS, Event Sourcing, Sagas

**Streams**: `<bc>-<aggregate>-<id>`; topics: `<bc>.<aggregate>.events.v1` (append), `<bc>.<aggregate>.state.v1` (compacted).  
**Envelope**: `eventId, tenantId, aggregateId, version, causationId, correlationId, actor, schemaVersion`.  
**Concurrency**: append with **expectedVersion**; handle conflicts by reload‑and‑retry.  
**Delivery**: consumer **inbox** dedup; **outbox** for DB→event publish; **DLQ** with retry metadata.  
**Projections**: support tail & rebuild, versioned projectors; snapshots every N events.  
**Sagas**: choreography (events) and orchestration (workflow) both available.

> See the detailed continuation for §18.2 shared alongside the canvas for proto/SQL/YAML snippets.
