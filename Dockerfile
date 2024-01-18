# Build go
FROM golang:1.21.4-alpine AS builder
WORKDIR /app
COPY . .
ENV CGO_ENABLED=0
RUN go mod download
RUN go build -v -o XrayR -trimpath -ldflags "-s -w -buildid="

# Release
FROM  alpine

RUN  apk --update --no-cache add tzdata ca-certificates \
    && cp /usr/share/zoneinfo/Asia/Tehran /etc/localtime


RUN mkdir /etc/XrayR/
COPY --from=builder /app/XrayR /usr/local/bin

COPY --from=builder /app/release/config/* /etc/XrayR/
COPY --from=builder /app/release/entrypoint.sh /etc/XrayR/


ENTRYPOINT ["/etc/XrayR/entrypoint.sh"]