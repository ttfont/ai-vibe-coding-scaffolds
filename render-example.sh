#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

"$SCRIPT_DIR/render.sh" \
  "$SCRIPT_DIR/variables.example.yaml" \
  "$SCRIPT_DIR/out"
