#!/bin/sh

# Did not work:
# --remote-debugging-address=$(hostname -i)

socat tcp-listen:$DEBUG_PORT,fork tcp:127.0.0.1:9223 &
chromium-browser \
  --disable-gpu \
  --disable-default-apps \
  --no-first-run \
  --start-fullscreen \
  --remote-debugging-port=9223
