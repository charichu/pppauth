FROM golang:1.19

ADD . /app
WORKDIR /app

COPY ./go.mod ./
COPY ./go.sum ./
RUN go mod download

RUN CGO_ENABLED=0 GOOS=linux go build -o /pppauth

EXPOSE 8000

CMD [ "/pppauth" ]