FROM golang:latest
WORKDIR build
COPY go.mod go.mod
COPY go.sum go.sum
RUN go mod download
COPY main.go main.go
RUN CGO_ENABLED=0 go build . 
CMD ["./platform", "serve", "--http=0.0.0.0:8080"]
