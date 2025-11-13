# ADR 0006: API Gateway & Protocols

- **Status**: Accepted
- **Date**: 2025-11-13
- **Decision**: Gateway terminates TLS, enforces rate‑limits/quotas/keys, emits audit/metering; service‑to‑service over mTLS (mesh). gRPC for service calls, GraphQL/REST for public APIs.
- **Why**: Flexibility at the edge + efficient internal RPC.
- **Consequences**: Requires good GraphQL/REST governance and codegen.
