#!/usr/bin/env bash
set -euo pipefail

REPO="https://github.com/brycedbjork/rc.git"
INSTALL_DIR="${HOME}/.rc-app"

# Check for bun
if ! command -v bun >/dev/null 2>&1; then
  echo "bun not found. Install it from https://bun.sh" >&2
  exit 1
fi

# Install sshpass (required for SSH key copying)
if ! command -v sshpass >/dev/null 2>&1; then
  echo "Installing sshpass..."
  if [[ "$OSTYPE" == "darwin"* ]]; then
    if command -v brew >/dev/null 2>&1; then
      brew install hudochenkov/sshpass/sshpass
    else
      echo "brew not found. Install sshpass manually or install Homebrew first." >&2
      exit 1
    fi
  elif command -v apt-get >/dev/null 2>&1; then
    sudo apt-get update && sudo apt-get install -y sshpass
  elif command -v yum >/dev/null 2>&1; then
    sudo yum install -y sshpass
  else
    echo "Could not install sshpass. Please install it manually." >&2
    exit 1
  fi
fi

# If running from curl pipe, clone the repo
if [[ ! -f "$(dirname "$0")/package.json" ]] 2>/dev/null; then
  echo "Cloning rc..."
  rm -rf "$INSTALL_DIR"
  git clone --depth 1 "$REPO" "$INSTALL_DIR"
  cd "$INSTALL_DIR"
else
  cd "$(dirname "$0")"
fi

bun install
bun link

if command -v rc >/dev/null 2>&1; then
  echo "Installed rc successfully."
  exit 0
fi

if bun_bin="$(bun bin 2>/dev/null)"; then
  echo "Installed rc to: $bun_bin"
  echo "Add to PATH: export PATH=\"$bun_bin:\$PATH\""
  exit 0
fi

echo "bun link completed, but rc is not on your PATH."
