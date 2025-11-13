# ADR 0002: Contracts‑First (Protobuf, AsyncAPI, OpenAPI)

- **Status**: Accepted
- **Date**: 2025-11-13
- **Decision**: All service boundaries defined via **Protobuf**; event streams via **AsyncAPI**; public REST/GraphQL via **OpenAPI**.
- **Why**: Consistent typing, codegen across languages, change management.
- **Consequences**: Requires schema discipline and CI checks; enables SDK generation and CDC testing.
