# Threat Model (STRIDE quick pass)

- **Spoofing**: strong auth (OIDC/API keys), mTLS, SPIFFE IDs.
- **Tampering**: signatures, immutability, audit trails.
- **Repudiation**: WORM logs, DSSE/cosign attestations.
- **Information Disclosure**: PII tokenization, encryption in transit/at rest.
- **Denial of Service**: quotas/limits, circuit breakers, autoscaling.
- **Elevation of Privilege**: least privilege, policy‑as‑code, code reviews.
