#!/usr/bin/env bash

# Polar Local Dev Server
PORT="${1:-3000}"

echo "🧭 Starting Polar local preview server on http://localhost:${PORT}..."
python3 -c '
import http.server
import socketserver
import os
import sys

port = int(sys.argv[1]) if len(sys.argv) > 1 else 3000

class CleanURLHandler(http.server.SimpleHTTPRequestHandler):
    def translate_path(self, path):
        orig_path = super().translate_path(path)
        if not os.path.exists(orig_path) and os.path.exists(orig_path + ".html"):
            return orig_path + ".html"
        return orig_path

with socketserver.TCPServer(("", port), CleanURLHandler) as httpd:
    try:
        httpd.serve_forever()
    except KeyboardInterrupt:
        pass
' "${PORT}"
