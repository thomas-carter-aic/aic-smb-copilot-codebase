# Playbook: Rebuild Projections

1. Pause writers for target aggregates (flag or maintenance window).
2. Start projector in **rebuild** mode (no side effects).
3. Monitor `projector_rebuild_progress`; adjust batch size throttle.
4. Validate read models vs snapshots; cut over by projection version.
