# ADR 0005: Multi‑Tenancy via Tenant Resolution + RLS (Default)

- **Status**: Accepted
- **Date**: 2025-11-13
- **Decision**: Resolve `tenant_id` at gateway; propagate via headers; enforce Row‑Level Security (RLS) in Postgres projections. Allow schema‑per‑tenant for large tenants as an exception.
- **Why**: Safety and simplicity; good density; RLS fits projections well.
- **Consequences**: Requires careful policy, migrations, and performance testing under RLS.
