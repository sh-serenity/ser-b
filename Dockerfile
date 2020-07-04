FROM golang:buster
ENV GOPATH /go
RUN apt-get update

WORKDIR /go
ADD ./d /go/

WORKDIR /go/d
RUN go get github.com/go-sql-driver/mysql github.com/gorilla/sessions github.com/shurcooL/github_flavored_markdown
RUN go build

RUN mkdir /app
RUN cp d /app
RUN cp -R ./static /app
RUN cp -R ./tmpl /app

WORKDIR /app

CMD /app/d


