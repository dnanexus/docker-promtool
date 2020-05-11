FROM golang:1.14
ARG prom_version
WORKDIR /tmp/build
RUN git clone https://github.com/prometheus/prometheus --branch v${prom_version} --single-branch --depth 1 && \
    cd prometheus && \
    PROMU_BINARIES=promtool make common-build
FROM alpine:3.11.6
COPY --from=0 /tmp/build/prometheus/promtool /bin
ENTRYPOINT ["/bin/promtool"]
