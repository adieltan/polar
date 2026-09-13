#!/usr/bin/env bash

# Polar Local Dev Server
PORT="${1:-3000}"

echo "🧭 Starting Polar local preview server on http://localhost:${PORT}..."
python3 -m http.server "${PORT}"
