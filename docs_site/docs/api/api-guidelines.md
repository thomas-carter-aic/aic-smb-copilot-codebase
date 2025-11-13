# API Guidelines

- **REST**: nouns for resources, plural, `POST` idempotency keys for unsafe ops.
- **GraphQL**: add‑only evolution, `@deprecated` with reason & removal date.
- **gRPC**: request/response messages always include `tenant_id`, `request_id`.
- **Errors**: machine‑readable codes; retryable vs non‑retryable; correlation id.
