#!/usr/bin/env bash
set -euo pipefail
if [[ $# -lt 2 ]]; then
  echo "Usage: $0 <name> <lang: go|py|ts|java>"
  exit 1
fi
NAME="$1"; LANG="$2"
ROOT="$(git rev-parse --show-toplevel 2>/dev/null || echo "$PWD")"
DIR="$ROOT/services/$NAME"
mkdir -p "$DIR"
case "$LANG" in
  go)
    mkdir -p "$DIR/cmd/server" "$DIR/internal"/{domain,app,ports,adapters} "$DIR/api"
    cat > "$DIR/cmd/server/main.go" <<'EOF'
package main
import ("log"; "net/http")
func main(){ http.HandleFunc("/health", func(w http.ResponseWriter,_ *http.Request){w.Write([]byte("ok"))}); log.Println("listening :8080"); http.ListenAndServe(":8080", nil) }
EOF
    ;;
  py)
    mkdir -p "$DIR/app"
    cat > "$DIR/app/main.py" <<'EOF'
from fastapi import FastAPI
app = FastAPI()
@app.get("/health")
def health(): return {"ok": True}
EOF
    ;;
  ts)
    mkdir -p "$DIR/src"
    cat > "$DIR/src/index.ts" <<'EOF'
import Fastify from 'fastify'
const app = Fastify({ logger: true })
app.get('/health', async () => ({ ok: true }))
app.listen({ port: 8080, host: '0.0.0.0' })
EOF
    ;;
  java)
    mkdir -p "$DIR/src/main/java/com/example"
    cat > "$DIR/src/main/java/com/example/App.java" <<'EOF'
package com.example;
public class App { public static void main(String[] a) throws Exception { System.out.println("ok"); Thread.sleep(Long.MAX_VALUE);} }
EOF
    ;;
  *)
    echo "unknown lang: $LANG"; exit 1;;
esac
echo "Scaffolded service at services/$NAME ($LANG)"
