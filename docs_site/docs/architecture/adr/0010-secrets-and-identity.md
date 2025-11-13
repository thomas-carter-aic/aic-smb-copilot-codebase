# ADR 0010: Secrets & Identity

- **Status**: Accepted
- **Date**: 2025-11-13
- **Decision**: Use SOPS + age for repo secrets; OIDC auth to cloud; Keycloak for SSO dev flows; API keys managed by `apikeys` service.
- **Why**: Safe local workflows; consistent identity story.
- **Consequences**: Key rotation runbooks and policy docs required.
