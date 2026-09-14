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
        if os.path.isdir(orig_path):
            index_path = os.path.join(orig_path, "index.html")
            if not os.path.exists(index_path) and os.path.exists(orig_path + ".html"):
                return orig_path + ".html"
        elif not os.path.exists(orig_path) and os.path.exists(orig_path + ".html"):
            return orig_path + ".html"
        return orig_path

    def send_error(self, code, message=None, explain=None):
        if code == 404 and os.path.exists("404.html"):
            self.send_response(404)
            self.send_header("Content-Type", "text/html; charset=utf-8")
            with open("404.html", "rb") as f:
                content = f.read()
            self.send_header("Content-Length", str(len(content)))
            self.end_headers()
            self.wfile.write(content)
            return
        super().send_error(code, message, explain)

with socketserver.TCPServer(("", port), CleanURLHandler) as httpd:
    try:
        httpd.serve_forever()
    except KeyboardInterrupt:
        pass
' "${PORT}"
