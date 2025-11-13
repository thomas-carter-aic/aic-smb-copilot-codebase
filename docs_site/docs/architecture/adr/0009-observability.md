# ADR 0009: Observability

- **Status**: Accepted
- **Date**: 2025-11-13
- **Decision**: **OpenTelemetry** for traces/metrics/logs, collected by OTel Collector and visualized in Grafana/Jaeger/Loki.
- **Why**: Vendor‑neutral, rich context, exemplar‑driven debugging.
- **Consequences**: Requires propagation and SDK setup in all services.
