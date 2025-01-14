FROM ubuntu:22.04 as base

RUN apt update -y && \
    apt install -y libc6 && \
    rm -rf /var/lib/apt/lists/*

FROM golang:1.18-buster as builder

ENV GOARCH=arm64
ENV GOOS=linux

WORKDIR /app

COPY . .

RUN go build -o /usr/local/bin/cowmessage

FROM base 

COPY --from=builder /usr/local/bin/cowmessage /usr/local/bin/

CMD ["/usr/local/bin/cowmessage"]