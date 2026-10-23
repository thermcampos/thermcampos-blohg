# Deployment

Blohg can be deployed in many ways. Here are the steps for Dokploy (current)
and Docker.

## Dokploy (current)

1. Create a project
2. Create an application
3. In the **General** upper tab, clicks **Docker** in the **Provider** tab
  * Then fills with
  * Docker image: `ghcr.io/thermcampos/blohg:0.14-rc3`
  * Registry URL: `ghcr.io`
  * Username: `thermcampos`
  * Password: `<blank>` (no passsword)
  * Click **Save**
4. In the **Domains** tab, at the top, click the **Add Domain** button, fill with
  * Host: `thermcampos.blog`
  * Path: `/` (default)
  * Internal Path: `/` (default)
  * Strip Path: `False` (toggle off)
  * Container Port: `8000`
  * Custom Entrypoint: `False` (toggle off)
  * HTTPS: `True` (toggle on)
  * Certificate Provider: `Let's Encrypt`
  * Middlewares: `<blank>` (empty)
  * Click **Save**
5. In the **Advance** tab, at the top, scrolls to **Volumes**
5.1. Click the **Add Volume** button
5.2. Select **Bind Mount** and fill
  * Host Path: `/home/betty/thermcampos-blohg`
  * Mounth Path (In the container): `/repo`
  * Click **Save**
6. In the **Environment** upper tab, add the following and click **Save**
  * `FORWARDED_ALLOW_IPS=*`
  * Traefik terminates HTTPS and forwards plain HTTP to the container. Without
    this, gunicorn ignores the proxy's `X-Forwarded-Proto` header and blohg
    generates `http://` URLs for images, feeds and attachments, which get
    blocked as mixed content
7. Go back to **General** upper tab
8. Click the **Deploy** button under **Deploy Settings**
9. Monitor logs in the **Logs** tab

Done

## Docker

For Docker, you only need to run the following docker command. Note the port, you
might have to change it to 443 and use a certificate to provide https.

```
docker run -d \
  --name blohg \
  -p 80:8000 \
  -v ~/rmcampos-blohg:/repo:ro \
  ghcr.io/thermcampos/blohg:0.14-rc3
```

