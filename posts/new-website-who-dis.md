# New Website, Who Dis?

Welcome to Polar! This is absolutely my experimental zone for random things I find interesting.
Actually more like a guide for myself in case I need it in the future :)
---

## 1. Get a website domain

Do note that 1st year prices are likely promotional, and subsequent annual renewal fees will be much higher.

## 2. Add Your Site to Cloudflare

1. Log in to your **[Cloudflare Dashboard](https://dash.cloudflare.com/)**.
2. Click **Add a site** in the top right.
3. Enter your apex domain (e.g. `909090909.xyz`) and select the **Free** tier plan.

---

## 3. Update Your Registrar Nameservers

Cloudflare will scan your existing DNS records and provide you with two assigned nameservers, such as:
- `ns1.cloudflare.com`
- `ns2.cloudflare.com`

Head over to where you purchased your domain:
1. Find the **Custom DNS / Nameservers** settings.
2. Replace the default registrar nameservers with the Cloudflare nameservers provided.
3. Save changes. *(Propagation takes some time, and you might have to try accessing it on other networks due to DNS caching).*

> **Tip:** If the domain is taking too long to load:
> - **Test on mobile data (4G/5G):** Your phone carrier usually refreshes DNS much faster than home Wi-Fi.
> - **Flush your local DNS cache:** On Mac, run `sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder` in Terminal. On Windows, run `ipconfig /flushdns`.
> - **Check global status:** Use a site like **[whatsmydns.net](https://www.whatsmydns.net/)** to see if your records have propagated globally.

---

## 4. Connect via Cloudflare Tunnel (`cloudflared`)

Instead of opening router ports or exposing a public home IP with standard `A` records, I used a **Cloudflare Tunnel**:

1. Install `cloudflared` on the server or run it as a Docker container.
2. In **Cloudflare Zero Trust** &rarr; **Networks** &rarr; **Tunnels**, create a new tunnel.
3. Add a **Public Hostname**:
   - **Domain:** `909090909.xyz`
   - **Type:** `HTTP`
   - **URL:** `localhost:8080` (or the internal Docker container port).
4. Cloudflare automatically handles the internal DNS routing for you (creating a secure `CNAME` pointing to `<tunnel-id>.cfargotunnel.com`). Zero router port forwarding needed!

> **Why Cloudflare Tunnel?** Your real home IP address stays 100% private, you don't need a static IP, and you never have to touch your home router's firewall.

---

## Conclusion

Once the nameservers have propagated and your tunnel is active, your website is live worldwide at `909090909.xyz`, complete with Cloudflare's standard protection!
