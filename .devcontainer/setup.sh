#!/usr/bin/env bash
set -euo pipefail
alias sudo='sudo -n' || true

PHASE="${1:-post}"

install_tools() {
  echo "[devcontainer] Installing extra tools (pnpm, buf, protoc, cosign, syft, k6, yq, jq) ..."
  # pnpm via corepack
  corepack enable || true
  corepack prepare pnpm@9.0.0 --activate || npm i -g pnpm@9 || true

  # protoc (protobuf-compiler)
  if ! command -v protoc >/dev/null 2>&1; then
    sudo apt-get update
    sudo apt-get install -y --no-install-recommends protobuf-compiler
  fi

  # yq & jq
  if ! command -v yq >/dev/null 2>&1; then
    sudo wget -qO /usr/local/bin/yq https://github.com/mikefarah/yq/releases/latest/download/yq_linux_amd64 && sudo chmod +x /usr/local/bin/yq || true
  fi
  if ! command -v jq >/dev/null 2>&1; then
    sudo apt-get install -y jq
  fi

  # buf
  if ! command -v buf >/dev/null 2>&1; then
    curl -sSL https://github.com/bufbuild/buf/releases/latest/download/buf-Linux-x86_64.tar.gz | sudo tar -xz -C /usr/local
  fi

  # cosign
  if ! command -v cosign >/dev/null 2>&1; then
    COSIGN_VERSION=$(curl -sSL https://api.github.com/repos/sigstore/cosign/releases/latest | jq -r .tag_name)
    curl -sSL -o /tmp/cosign.deb https://github.com/sigstore/cosign/releases/download/${COSIGN_VERSION}/cosign_amd64.deb
    sudo dpkg -i /tmp/cosign.deb || true
  fi

  # syft
  if ! command -v syft >/dev/null 2>&1; then
    curl -sSfL https://raw.githubusercontent.com/anchore/syft/main/install.sh | sudo sh -s -- -b /usr/local/bin
  fi

  # k6
  if ! command -v k6 >/dev/null 2>&1; then
    curl -s https://dl.k6.io/key.gpg | sudo gpg --dearmor -o /usr/share/keyrings/k6-archive-keyring.gpg
    echo "deb [signed-by=/usr/share/keyrings/k6-archive-keyring.gpg] https://dl.k6.io/deb stable main" | sudo tee /etc/apt/sources.list.d/k6.list
    sudo apt-get update && sudo apt-get install -y k6
  fi

  echo "[devcontainer] Tool installation complete."
}

post_create() {
  echo "[devcontainer] Post-create tasks..."
  git config --global --add safe.directory /workspaces/* || true
  # Optional: initial package installs if monorepo has manifests
  if [ -f package.json ]; then
    pnpm i -w || npm ci || true
  fi
  if [ -f go.mod ]; then
    go mod download || true
  fi
  if [ -f "gradlew" ]; then
    ./gradlew --version || true
  fi
  if [ -f "buf.yaml" ] || [ -f "buf.work.yaml" ]; then
    buf mod update || true
  fi
  echo "[devcontainer] Done."
}

case "$PHASE" in
  init) install_tools ;;
  post) post_create ;;
  *) install_tools && post_create ;;
esac
