FROM alpine:latest AS stage1

WORKDIR /app
COPY    /app .

RUN apk add --no-cache go && \
    go build -o bin/hello

FROM scratch
COPY --from=stage1 /app/bin/ /app/bin/

CMD ["/app/bin/hello"]

