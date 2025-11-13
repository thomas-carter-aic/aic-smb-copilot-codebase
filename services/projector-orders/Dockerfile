
FROM golang:1.22 as build
WORKDIR /src
COPY . .
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o /out/projector ./cmd/projector
FROM gcr.io/distroless/static-debian12:nonroot
COPY --from=build /out/projector /projector
USER nonroot:nonroot
ENTRYPOINT ["/projector"]
