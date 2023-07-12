FROM golang:alpine AS builder

WORKDIR /app

COPY . .

RUN CGO_ENABLED=0 GOOS=linux go build -o app

FROM scratch
COPY --from=builder /app/app /
CMD ["/app"]
