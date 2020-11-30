FROM golang:1.14-alpine AS builder

WORKDIR /go/src/app
COPY . .

RUN GOOS=linux GOARCH=amd64 go build -ldflags="-w -s" -o  .

FROM scratch
COPY --from=builder /go/src/app /
CMD [ "/app" ]
