FROM golang:1.20

WORKDIR /app

COPY go.mod .
COPY src/main.go .
COPY scripts/entrypoint.sh .
RUN chmod +x entrypoint.sh

RUN go get
RUN go build -o bin .

ENTRYPOINT [ "/app/entrypoint.sh" ]