# ADR 0013: Testing Strategy

- **Status**: Accepted
- **Date**: 2025-11-13
- **Decision**: TDD for units, Testcontainers for integration, Playwright for E2E, Pact for CDC, k6 for perf smoke, optional BDD for key flows.
- **Why**: Confidence without fragile environments.
- **Consequences**: Test discipline and maintenance.
