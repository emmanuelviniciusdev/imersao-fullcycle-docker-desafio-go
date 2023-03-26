FROM golang:latest AS builder

WORKDIR /usr/src/app

COPY ./greetings.go .

RUN go build -ldflags "-s -w" greetings.go

FROM scratch

COPY --from=builder /usr/src/app/greetings .

ENTRYPOINT [ "./greetings" ]
