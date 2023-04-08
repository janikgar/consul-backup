FROM hashicorp/consul:1.15 AS consul
FROM minio/mc:latest as minio

FROM alpine:3.17

COPY --from=minio /usr/bin/mc /usr/bin/
COPY --from=consul /bin/consul /bin/

ADD --chmod=0755 entrypoint.sh /
RUN apk update

ENTRYPOINT ["/entrypoint.sh"]
