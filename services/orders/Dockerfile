
FROM golang:1.22 as build
WORKDIR /src
COPY . .
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o /out/orders ./cmd/server
FROM gcr.io/distroless/static-debian12:nonroot
COPY --from=build /out/orders /orders
USER nonroot:nonroot
EXPOSE 8080
ENTRYPOINT ["/orders"]
