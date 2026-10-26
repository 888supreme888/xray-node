#!/bin/sh
PORT="${PORT:-10000}"
sed -i "s/\"port\": 10000/\"port\": ${PORT}/" /etc/xray/config.json
echo "xray listening on port ${PORT}"
exec /usr/local/bin/xray -config /etc/xray/config.json
