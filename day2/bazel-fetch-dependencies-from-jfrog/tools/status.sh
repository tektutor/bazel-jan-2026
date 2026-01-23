#!/usr/bin/env bash
# Minimal workspace_status.sh
echo "STABLE_BUILD_SCM_REV=$(git rev-parse --short HEAD 2>/dev/null || echo unknown)"
echo "STABLE_BUILD_TIMESTAMP=$(date +%s)"

