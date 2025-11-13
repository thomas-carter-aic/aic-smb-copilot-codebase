# ADR 0001: Polyglot Monorepo without Bazel

- **Status**: Accepted
- **Date**: 2025-11-13
- **Decision**: Use a polyglot monorepo (Go, TypeScript, Python, Java) **without Bazel**.
- **Why**: Faster onboarding, simpler mental model, native language toolchains with shared repo ergonomics.
- **How**: `just` + Make, Turborepo for TS, Gradle cache for Java, native Go/Python caches; Docker BuildKit for images.
- **Consequences**: Slightly less hermetic than Bazel; offset by devcontainers, pinned toolchains, and CI guards.
