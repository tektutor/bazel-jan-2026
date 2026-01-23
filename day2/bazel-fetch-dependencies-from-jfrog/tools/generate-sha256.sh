#!/usr/bin/env bash
# generate-sha256.sh - Automatically compute SHA256 of your dependency tarball

TAR_FILE="mydep-1.0.0.tar.gz"
MODULE_FILE="MODULE.bazel"

if [[ ! -f "$TAR_FILE" ]]; then
    echo "Error: $TAR_FILE not found!"
    exit 1
fi

# Compute SHA256
SHA=$(sha256sum "$TAR_FILE" | awk '{print $1}')

# Replace or insert SHA256 in MODULE.bazel
if grep -q "sha256 = " "$MODULE_FILE"; then
    # Update existing SHA
    sed -i "s/sha256 = \".*\"/sha256 = \"$SHA\"/" "$MODULE_FILE"
else
    # Insert SHA line (after urls line)
    sed -i "/urls = \[/a\    sha256 = \"$SHA\"," "$MODULE_FILE"
fi

echo "Updated MODULE.bazel with SHA256: $SHA"

