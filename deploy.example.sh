#!/usr/bin/env bash
set -e

# Deployment Script Template
# Copy this to deploy.sh and update with your server credentials:
# cp deploy.example.sh deploy.sh

SERVER_USER="your-username"
SERVER_HOST="your-server-hostname-or-ip"
REMOTE_DEST="/var/www/html/"

echo "🚀 Deploying to ${SERVER_HOST}..."

rsync -avz --delete \
  --exclude '.git' \
  --exclude '.DS_Store' \
  --exclude 'deploy*.sh' \
  --exclude 'serve.sh' \
  --exclude 'README.md' \
  ./ "${SERVER_USER}@${SERVER_HOST}:${REMOTE_DEST}"

echo "✅ Deployed successfully!"
