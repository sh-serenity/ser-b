FROM golang:buster
ENV GOPATH /go
RUN apt-get update
RUN apt-get install git

WORKDIR /go
RUN mkdir /go/serenity-blog

WORKDIR /go/serenity-blog
RUN go get github.com/go-sql-driver/mysql github.com/gorilla/sessions github.com/shurcooL/github_flavored_markdown
RUN go build

RUN mkdir /app
RUN cp serenity-blog /app
RUN cp -R ./static /app
RUN cp -R ./tmpl /app

WORKDIR /app

CMD /app/serenity-blog


