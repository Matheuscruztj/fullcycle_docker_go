FROM golang:1.16-alpine AS builder

RUN apk update

WORKDIR /app

COPY go.* ./

RUN go mod download

COPY *.go ./

RUN go build -o /main


FROM scratch

WORKDIR /

COPY --from=builder /main /main

ENTRYPOINT ["/main"]
