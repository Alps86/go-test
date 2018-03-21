FROM golang:latest as build
WORKDIR /app
COPY . .
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o main .

FROM scratch
COPY --from=build /app /app
EXPOSE 1718

CMD ["/app/main"]

