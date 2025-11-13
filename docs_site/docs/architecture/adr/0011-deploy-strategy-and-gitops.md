# ADR 0011: Release Strategy & GitOps

- **Status**: Accepted
- **Date**: 2025-11-13
- **Decision**: GitOps via Argo CD; progressive delivery via Argo Rollouts with SLO guard rails.
- **Why**: Safe, visible, auditable deployments.
- **Consequences**: Requires Prometheus metrics and analysis templates.
