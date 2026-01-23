#!/usr/bin/env bash
set -euo pipefail

# ----------------------------
# Configuration
# ----------------------------
ARTIFACTORY_URL="http://172.17.0.3:8082/artifactory/"
ARTIFACTORY_REPO="my-repo"
# JFROG_USER and JFROG_API_KEY should be exported in your environment
# export JFROG_USER=admin
# export JFROG_API_KEY=<your-api-key>

# Bazel workspace status script
WORKSPACE_STATUS="./tools/status.sh"

# Bazel target
TARGET="//:myapp_release"

# ----------------------------
# Check environment variables
# ----------------------------
if [[ -z "${JFROG_USER:-}" ]] || [[ -z "${JFROG_API_KEY:-}" ]]; then
    echo "ERROR: JFROG_USER and JFROG_API_KEY must be set"
    exit 1
fi

# ----------------------------
# Clean Bazel
# ----------------------------
echo "Cleaning Bazel..."
bazel shutdown
bazel clean --expunge

# ----------------------------
# Build tarball with stamping
# ----------------------------
echo "Building Bazel target: $TARGET"
bazel build --stamp --workspace_status_command="$WORKSPACE_STATUS" "$TARGET"

TAR_PATH=$(bazel info bazel-bin)/myapp_release.tar
VERSION=$(git rev-parse --short HEAD 2>/dev/null || echo "unknown")

echo "Built tarball: $TAR_PATH"
echo "Version (git sha): $VERSION"

# ----------------------------
# Upload to Artifactory
# ----------------------------
echo "Uploading to Artifactory..."
jfrog rt u "$TAR_PATH" "$ARTIFACTORY_REPO/myapp_release-${VERSION}.tar" \
    --url="$ARTIFACTORY_URL" \
    --user="$JFROG_USER" \
    --apikey="$JFROG_API_KEY"

echo "Upload complete: $ARTIFACTORY_URL$ARTIFACTORY_REPO/myapp_release-${VERSION}.tar"

