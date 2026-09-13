# 🧭 Polar (`909090909.xyz`)

**Polar** is a minimalist engineering showcase website for self-hosted services, microservices, and local AI projects.

---

## 🛠️ Stack & Principles
- **Pure Vanilla:** Modern semantic HTML5, CSS3 with CSS variables, zero JavaScript dependencies.
- **Ultra-Fast & Lightweight:** Zero build step, instant cold-load performance.
- **Production Server:** Hosted on `a456u` (Ubuntu Linux) via Docker Nginx, routed through Cloudflare Tunnel with automatic HTTPS.

---

## 💻 Local Development

Run the local preview server:
```bash
./serve.sh
# Opens on http://localhost:3000
```

---

## 🚀 1-Command Deployment

Sync updates directly to the production server:
```bash
chmod +x deploy.sh
./deploy.sh
```

This uses `rsync` over SSH to update `/home/rh/stacks/cloudflare-tunnel/html/` on `a456u`.

---

## 🌐 Live URLs
- **Public Domain:** [https://909090909.xyz/](https://909090909.xyz/)
- **Internal Preview:** [http://a456u:8080](http://a456u:8080)
