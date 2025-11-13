# Quickstart

1. **Clone** the repo and unzip the `/dev` kit at the root.
2. (Optional) `cp dev/.env.example dev/.env`
3. Start the local stack:
   ```bash
   just dev-up
   ```
4. Open tooling:
   - Grafana → http://localhost:3000 (admin/admin)
   - Prometheus → http://localhost:9090
   - Jaeger → http://localhost:16686
   - Redpanda Console → http://localhost:8081
   - MinIO → http://localhost:9001
   - MailHog → http://localhost:8025
   - Keycloak → http://localhost:8080
5. Create a service skeleton:
   ```bash
   dev/bin/new-service.sh orders go
   ```
6. Run tests and linters:
   ```bash
   just fmt && just lint && just test
   ```
7. Generate contracts:
   ```bash
   just proto && just contracts
   ```
