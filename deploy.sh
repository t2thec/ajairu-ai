#!/bin/bash
# Deploy ajairu.ai to movo server
# Usage: ./deploy.sh
# Builds locally and pushes to server via rsync

set -e

SITE_DIR="$(cd "$(dirname "$0")" && pwd)"
SERVER="forge@178.128.160.118"
REMOTE_PATH="/home/forge/ajairu.ai/public/"

echo "Building ajairu.ai..."
cd "$SITE_DIR"
npx astro build

echo "Deploying to movo..."
rsync -avz --delete dist/ "$SERVER:$REMOTE_PATH"

echo "✓ Deployed to http://178.128.160.118 (Host: ajairu.ai)"
echo "  View with: curl -u toby:ajairu2026 -H 'Host: ajairu.ai' http://178.128.160.118/"