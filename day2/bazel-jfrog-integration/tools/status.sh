#!/usr/bin/env bash
set -euo pipefail

echo "BUILD_GIT_COMMIT $(git rev-parse HEAD)"
echo "BUILD_GIT_DIRTY $(git diff --quiet || echo 1)"
echo "BUILD_DATE $(date -u +'%Y-%m-%dT%H:%M:%SZ')"
echo "BUILD_USER ${USER:-unknown}"
