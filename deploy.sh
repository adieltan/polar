#!/usr/bin/env bash
set -e

# Polar Deployment Script
# Syncs static website files to the a456u home server

SERVER_USER="rh"
SERVER_HOST="a456u"
REMOTE_DEST="/home/rh/stacks/cloudflare-tunnel/html/"

echo "🚀 Deploying Polar showcase to ${SERVER_HOST}..."

rsync -avz --delete \
  --exclude '.git' \
  --exclude '.DS_Store' \
  --exclude 'deploy.sh' \
  --exclude 'serve.sh' \
  --exclude 'README.md' \
  ./ "${SERVER_USER}@${SERVER_HOST}:${REMOTE_DEST}"

echo "✅ Deployed successfully to ${REMOTE_DEST}!"
echo "🌐 Local preview:  http://a456u:8080"
echo "🌐 Public domain:  https://909090909.xyz/"
