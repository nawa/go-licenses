FROM golang:1.22-alpine as installer
# Build go-licenses
RUN go install github.com/google/go-licenses@v1.6.0

FROM alpine:3.18 as base

COPY --from=installer /go/bin/go-licenses /

ENTRYPOINT ["/go-licenses"]