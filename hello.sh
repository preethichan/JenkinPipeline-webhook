#!/bin/bash
# ─────────────────────────────────────────────
# hello.sh — Sample script for Jenkins CI demo
# ─────────────────────────────────────────────

echo "============================================"
echo "  Build triggered by Jenkins CI Pipeline"
echo "============================================"
echo "Hostname   : $(hostname)"
echo "Date/Time  : $(date)"
echo "Git Commit : ${GIT_COMMIT:-N/A}"
echo "Git Branch : ${GIT_BRANCH:-N/A}"
echo "Build No.  : ${BUILD_NUMBER:-N/A}"
echo "Workspace  : ${WORKSPACE:-N/A}"
echo "--------------------------------------------"
echo "Running application tests..."

# Simulate a simple test
EXPECTED="Hello Jenkins"
ACTUAL="Hello Jenkins"

if [ "$EXPECTED" == "$ACTUAL" ]; then
    echo "[PASS] Test 1: String comparison test passed."
else
    echo "[FAIL] Test 1: String comparison test failed."
    exit 1
fi

echo "[PASS] All tests passed successfully."
echo "============================================"
echo "BUILD COMPLETE — Status: SUCCESS"
echo "============================================"
# webhook test
