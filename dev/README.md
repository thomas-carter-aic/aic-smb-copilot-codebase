# Dev Environment Kit

This `/dev` directory spins up a full local platform for coding and testing:
Redpanda (Kafka), Postgres, Redis, MinIO, MailHog, OpenTelemetry Collector, Prometheus, Loki, Jaeger, Grafana, and Keycloak.

## Quickstart
1. Copy env: `cp dev/.env.example dev/.env` (optional)
2. Start stack: `just dev-up` (or `docker compose -f dev/docker-compose.yml up -d`)
3. Observe:
   - Grafana: http://localhost:${GRAFANA_PORT:-3000}
   - Prometheus: http://localhost:${PROMETHEUS_PORT:-9090}
   - Jaeger UI: http://localhost:${JAEGER_UI_PORT:-16686}
   - Redpanda Console: http://localhost:${REDPANDA_CONSOLE_PORT:-8081}
   - MinIO Console: http://localhost:${MINIO_CONSOLE_PORT:-9001}
   - MailHog UI: http://localhost:${MAILHOG_PORT:-8025}
   - Keycloak: http://localhost:${KEYCLOAK_HTTP_PORT:-8080}

## Tilt (optional)
`tilt up` to orchestrate the stack via Tilt using `docker-compose`.

## Pre-commit
Install hooks at repo root:
```bash
pipx install pre-commit  # or pip install --user pre-commit
pre-commit install --config dev/.pre-commit-config.yaml
```
(You can copy the file to `.pre-commit-config.yaml` at the repo root if preferred.)

## Notes
- OpenTelemetry Collector exposes metrics for Prometheus on `:8889`, receives OTLP on `:4317/:4318`, ships traces to Jaeger and logs to Loki.
- Use environment variables in `dev/.env` to change ports or credentials.
- This stack is for **local development only**.
