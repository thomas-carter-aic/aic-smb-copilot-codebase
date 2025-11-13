# Security Model

- **Zero‑trust**: mTLS everywhere; SPIFFE identities for workloads.
- **Edge**: API keys, OAuth2/OIDC; rate limits; WAF/bot mitigation.
- **Data**: tokenization/pseudonymization; per‑tenant keys (KMS/Vault); least privilege.
- **Supply chain**: SBOMs, signatures, provenance attestation.
