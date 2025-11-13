
FROM golang:1.22 as build
WORKDIR /src
COPY . .
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o /out/payments ./cmd/server
FROM gcr.io/distroless/static-debian12:nonroot
COPY --from=build /out/payments /payments
USER nonroot:nonroot
EXPOSE 8080
ENTRYPOINT ["/payments"]
