# ADR 0004: CQRS + Sagas

- **Status**: Accepted
- **Date**: 2025-11-13
- **Decision**: Commands write to event store; queries hit read models. Both **choreography** and **orchestration** styles supported.
- **Why**: Decouple write/read performance and availability; model long-running business workflows safely.
- **Consequences**: More moving parts (projectors, rebuilds); offset by templates and runbooks.
