# Docker base images

## Chromium

Using Chromium package available via Alpine edge channel
https://pkgs.alpinelinux.org/package/edge/community/x86_64/chromium

Image is good to use as-is if provided with connection to X or Xvfb display service.
See DISPLAY env variable.

Exposed port for Chrome Remote Debugging protocol. Seed DEBUG_PORT env variable.

Chromium is not binding debugging port to 0.0.0.0,
simple socat being used to tunnel incoming traffic.

Custom seccomp has been ignored.
Only security option which was working with the service configured in docker compose:

```yaml
security_opt:
  - seccomp:unconfined
```
