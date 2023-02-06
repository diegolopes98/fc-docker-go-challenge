FROM golang:1.20-alpine as BUILD

WORKDIR /go/src/app

COPY ./main.go /go/src/app/

RUN go build main.go

FROM scratch

COPY --from=BUILD /go/src/app ./

ENTRYPOINT [ "./main" ]
