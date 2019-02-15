FROM alpine:3.9

ENV RCLONE_VERSION=1.46
ENV ARCH=amd64

RUN apk -U add ca-certificates wget bash \
    && rm -rf /var/cache/apk/* \
    && wget -q http://downloads.rclone.org/v${RCLONE_VERSION}/rclone-v${RCLONE_VERSION}-linux-${ARCH}.zip

RUN unzip rclone-${RCLONE_VERSION}-linux-${ARCH}.zip \
    && mv rclone-*-linux-${ARCH}/rclone /usr/bin \
    && rm -r rclone*

RUN rclone -V

ENTRYPOINT ["/bin/bash"]