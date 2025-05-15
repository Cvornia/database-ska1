FROM alpine:latest

ARG VERSION=0.22.1

WORKDIR /app

ADD https://github.com/pocketbase/pocketbase/releases/download/v${VERSION}/pocketbase_${VERSION}_linux_amd64.zip /pocketbase.zip

RUN apk add unzip && \
    unzip /pocketbase.zip && \
    rm /pocketbase.zip

COPY pb_data/ ./pb_data/

EXPOSE 8090

CMD ["./pocketbase", "serve", "--http=0.0.0.0:8090"]
