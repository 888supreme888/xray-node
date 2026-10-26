FROM alpine:3.19

RUN apk add --no-cache curl unzip ca-certificates

RUN curl -L -o /tmp/xray.zip \
      "https://github.com/XTLS/Xray-core/releases/latest/download/Xray-linux-64.zip" \
    && mkdir -p /usr/local/bin \
    && unzip -o /tmp/xray.zip -d /usr/local/bin \
    && rm -f /tmp/xray.zip \
    && chmod +x /usr/local/bin/xray

COPY config.json /etc/xray/config.json
COPY start.sh /start.sh
RUN chmod +x /start.sh

ENV PORT=10000
EXPOSE 10000

CMD ["/start.sh"]
