#!/usr/bin/env bash
set -euo pipefail

# -----------------------------
# Config
# -----------------------------
DEP_TAR="mydep-1.0.0.tar.gz"
MODULE_FILE="MODULE.bazel"
ARTIFACTORY_URL="http://172.17.0.3:8082/artifactory/my-repo/"
ARTIFACT_PREFIX="myapp"
STATUS_CMD="./tools/status.sh"

# Artifactory credentials (export in env: JFROG_USER & JFROG_API_KEY)
JFROG_USER=${JFROG_USER:?Please set JFROG_USER}
JFROG_API_KEY=${JFROG_API_KEY:?Please set JFROG_API_KEY}

# -----------------------------
# 1️⃣ Update SHA256 in MODULE.bazel
# -----------------------------
if [[ ! -f "$DEP_TAR" ]]; then
    echo "Error: $DEP_TAR not found!"
    exit 1
fi

SHA=$(sha256sum "$DEP_TAR" | awk '{print $1}')

if grep -q "sha256 = " "$MODULE_FILE"; then
    sed -i "s/sha256 = \".*\"/sha256 = \"$SHA\"/" "$MODULE_FILE"
else
    sed -i "/urls = \[/a\    sha256 = \"$SHA\"," "$MODULE_FILE"
fi

echo "✅ Updated MODULE.bazel with SHA256: $SHA"

# -----------------------------
# 2️⃣ Compute artifact version
# -----------------------------
# Using Git short SHA + timestamp
GIT_SHA=$(git rev-parse --short HEAD 2>/dev/null || echo "nogit")
TS=$(date +%Y%m%d%H%M%S)
VERSION="${GIT_SHA}-${TS}"

echo "✅ Artifact version: $VERSION"

# -----------------------------
# 3️⃣ Clean Bazel and build
# -----------------------------
echo "🛠 Cleaning Bazel..."
bazel shutdown
bazel clean --expunge

echo "🛠 Building Bazel target: //:myapp_release"
bazel build --stamp --workspace_status_command="$STATUS_CMD" //:myapp_release

TAR_PATH=$(bazel info bazel-bin)/myapp_release.tar
ARTIFACT_NAME="${ARTIFACT_PREFIX}-${VERSION}.tar"

echo "✅ Built tarball: $TAR_PATH"
echo "Artifact will be uploaded as: $ARTIFACT_NAME"

# -----------------------------
# 4️⃣ Upload to JFrog Artifactory
# -----------------------------
if ! command -v jfrog &> /dev/null; then
    echo "Error: jfrog CLI not installed. Install it to upload artifacts."
    exit 1
fi

echo "⬆️ Uploading to Artifactory..."
jfrog rt u "$TAR_PATH" "${ARTIFACTORY_URL}${ARTIFACT_NAME}" \
    --user="$JFROG_USER" --apikey="$JFROG_API_KEY"

echo "✅ Artifact uploaded successfully!"
echo "URL: ${ARTIFACTORY_URL}${ARTIFACT_NAME}"

