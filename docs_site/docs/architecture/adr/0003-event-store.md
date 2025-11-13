# ADR 0003: Event Store on Redpanda/Kafka + Snapshots in Postgres

- **Status**: Accepted
- **Date**: 2025-11-13
- **Decision**: Use Redpanda (Kafka) as the event store with compacted state topics; store snapshots in Postgres. EventStoreDB remains a **Should** option.
- **Why**: Operational ubiquity, strong ecosystem, good local dev experience, compacted topics fit aggregates.
- **Consequences**: EOS patterns needed for read‑process‑write; provide outbox/inbox libraries and DLQ.
- **Alternatives**: EventStoreDB (native streams), Pulsar (segments), NATS JetStream (KV/streams).
