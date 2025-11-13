#!/usr/bin/env bash
set -euo pipefail
if [[ $# -lt 2 ]]; then
  echo "Usage: $0 <boundedContext> <aggregate>"
  exit 1
fi
BC="$1"; AGG="$2"
ROOT="$(git rev-parse --show-toplevel 2>/dev/null || echo "$PWD")"
DIR="$ROOT/contracts/asyncapi"
mkdir -p "$DIR"
FILE="$DIR/${BC}.${AGG}.events.v1.yaml"
cat > "$FILE" <<EOF
asyncapi: 3.0.0
info: { title: ${BC}.${AGG}.events, version: 1.0.0 }
channels:
  ${BC}.${AGG}.events.v1:
    address: ${BC}.${AGG}.events.v1
    messages:
      created:
        name: ${AGG^}Created
        payload:
          type: object
          properties:
            id: { type: string }
            tenantId: { type: string }
EOF
echo "Created $FILE"
