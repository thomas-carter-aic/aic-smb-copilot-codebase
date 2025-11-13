# Release & CI/CD

- **PR CI**: language tests, contracts checks (buf, AsyncAPI, OpenAPI), gitleaks, trivy.
- **Build & Sign**: BuildKit cache, push to GHCR, SBOM (SPDX), **cosign** keyless signatures, **SLSA provenance**.
- **Deploy**: GitOps (Argo CD) + progressive delivery (Argo Rollouts).
