#!/usr/bin/env bash
set -euo pipefail

# Always run from the repository root so latexmk finds the sources.
REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$REPO_ROOT"

latexmk -xelatex BaykalCV.tex "$@"
