# ADR 0007: Service Mesh & Resilience

- **Status**: Accepted
- **Date**: 2025-11-13
- **Decision**: Adopt a mesh (Istio or Linkerd) to enforce mTLS, retries/timeouts/circuit breakers, and provide traffic policies.
- **Why**: Uniform reliability and security controls.
- **Consequences**: Adds operational overhead; mitigated with GitOps and golden configs.
