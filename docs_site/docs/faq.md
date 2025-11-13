# FAQ

**Q: Do I need Docker to run locally?**  
A: Yes; the `/dev` stack uses docker‑compose for infra services.

**Q: Where are API contracts?**  
A: Under `contracts/` (proto, asyncapi, openapi).

**Q: How do I add a new service?**  
A: `dev/bin/new-service.sh <name> <go|py|ts|java>` then wire its Dockerfile and manifests.
