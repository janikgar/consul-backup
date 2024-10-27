FROM busybox as builder

WORKDIR /tmp

ADD https://releases.hashicorp.com/consul/1.19.2/consul_1.19.2_linux_arm64.zip /tmp/consul.zip

RUN unzip /tmp/consul.zip

FROM minio/mc:latest

COPY --from=builder /tmp/consul /usr/local/bin/consul

ADD --chmod=0755 entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]