FROM sergef/docker-library-alpine:edge

# curl -o seccomp.json https://raw.githubusercontent.com/jfrazelle/dotfiles/master/etc/docker/seccomp/chrome.json
# not woking via compose,
# using:
# security_opt:
# - seccomp:unconfined

RUN apk add --no-cache \
    chromium@community \
    dbus \
    mesa-gl \
    ttf-freefont \
    socat \
    udev \
  && dbus-uuidgen > /var/lib/dbus/machine-id \
  && adduser -G users -g "Chrome User Account" -s /bin/sh -D chrome

ENV DEBUG_PORT=9222
ENV DISPLAY=xvfb:99

EXPOSE ${DEBUG_PORT}

COPY entrypoint.sh /entrypoint.sh
RUN chmod ugo+x /entrypoint.sh

USER chrome

ENTRYPOINT ["tini", "--", "/entrypoint.sh"]