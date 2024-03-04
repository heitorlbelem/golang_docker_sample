FROM golang:1.21-alpine as base_builder
WORKDIR /src
COPY ./main.go ./main.go
RUN go build -o /bin/main ./main.go

FROM scratch
COPY --from=base_builder bin/main bin/main
CMD ["bin/main"]