FROM gcc:12.1.0 as builder
LABEL maintainer="oegaurab@gmail.com"

COPY ./file.c /peachy/new/
RUN gcc /peachy/new/file.c -o /peachy/a

# lets try multi-stage build
FROM alpine
COPY --from=builder /peachy/a /peachy/a

ENTRYPOINT ["/peachy/a"]
