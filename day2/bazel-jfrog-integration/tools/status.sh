#!/usr/bin/env bash
# Reproducible stamping info

# Short git commit hash, fallback to UNKNOWN
GIT_REV=$(git rev-parse --short HEAD 2>/dev/null || echo UNKNOWN)

# Bazel project version
BUILD_VERSION=1.0.0

echo "BUILD_SCM_REV ${GIT_REV}"
echo "BUILD_VERSION ${BUILD_VERSION}"
