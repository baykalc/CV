#!/usr/bin/env bash
set -euo pipefail

# Determine repository roots
CV_REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
WEBSITE_REPO_ROOT="${WEBSITE_REPO:-$CV_REPO_ROOT/../website}"
OUTPUT_NAME="${OUTPUT_NAME:-BaykalCV.pdf}"
SOURCE_PDF="$CV_REPO_ROOT/resume.pdf"
TARGET_PDF="$WEBSITE_REPO_ROOT/$OUTPUT_NAME"

# Ensure website repository exists
if [[ ! -d "$WEBSITE_REPO_ROOT/.git" ]]; then
  echo "Error: website repository not found at $WEBSITE_REPO_ROOT" >&2
  echo "Set WEBSITE_REPO to the website repo path before rerunning." >&2
  exit 1
fi

# Build the resume
"$CV_REPO_ROOT/compile_cv.sh" "$@"

# Copy PDF into the website repo with the desired name
install -m 644 "$SOURCE_PDF" "$TARGET_PDF"

# Stage, commit, and push the updated PDF
pushd "$WEBSITE_REPO_ROOT" >/dev/null
if git diff --quiet -- "$OUTPUT_NAME" && git diff --cached --quiet -- "$OUTPUT_NAME"; then
  echo "No changes detected in $OUTPUT_NAME; skipping commit." >&2
else
  git add "$OUTPUT_NAME"
  if git diff --cached --quiet -- "$OUTPUT_NAME"; then
    echo "No staged changes for $OUTPUT_NAME; skipping commit." >&2
  else
    git commit -m "assets: update Baykal CV"
    git push
  fi
fi
popd >/dev/null
