# ADR 0008: CI Security & Supply Chain

- **Status**: Accepted
- **Date**: 2025-11-13
- **Decision**: BuildKit with cache; GHCR registry; SBOM (SPDX) via Syft; **cosign** keyless signing; **SLSA** provenance; trivy & gitleaks scans.
- **Why**: Integrity, traceability, and compliance.
- **Consequences**: Slight CI runtime increase; significant security benefits.
