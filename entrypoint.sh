#!/bin/sh

if [ "$1" = "headless" ]
then
  chromium-browser \
    --disable-gpu \
    --disable-default-apps \
    --no-first-run \
    --headless \
    --remote-debugging-port=$DEBUG_PORT \
    --remote-debugging-address=0.0.0.0
elif [ "$1" = "xvfb" ]
then
  # --remote-debugging-address=0.0.0.0 Not working?
  socat tcp-listen:$DEBUG_PORT,fork tcp:127.0.0.1:9223 &
  chromium-browser \
    --disable-gpu \
    --disable-default-apps \
    --no-first-run \
    --start-fullscreen \
    --remote-debugging-port=9223
else
  echo "Command-line argument is not defined. Define: 'headless' or 'xvfb'."
fi
