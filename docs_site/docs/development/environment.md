# Developer Environment

- **Devcontainer**: Docker‑in‑Docker, Node 20, Go 1.22, Python 3.12, Java 21.
- **Local stack** via `dev/docker-compose.yml` (Redpanda, Postgres, Redis, MinIO, OTel, Prometheus, Loki, Jaeger, Grafana, Keycloak).
- **OTel** endpoints: OTLP gRPC `4317`, HTTP `4318`.

## Commands
- `just dev-up | dev-down | dev-logs | dev-reset`
- `tilt up` (optional) – live sync into k3d/kind when you want k8s locally.
