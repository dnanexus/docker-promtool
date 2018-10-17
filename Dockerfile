FROM golang:1.11

RUN GOOS=linux GOARCH=amd64 CGO_ENABLED=0 go get -u github.com/prometheus/prometheus/cmd/promtool

FROM alpine:3.8

COPY --from=0 /go/bin/promtool /bin
CMD ["/bin/sh"]  
