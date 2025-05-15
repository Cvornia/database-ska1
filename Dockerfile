FROM alpine:latest

WORKDIR /app

ADD https://github.com/pocketbase/pocketbase/releases/download/v0.21.1/pocketbase_0.21.1_linux_amd64.zip pocketbase.zip

RUN apk add --no-cache unzip && \
    unzip pocketbase.zip && \
    rm pocketbase.zip

COPY pb_data pb_data
COPY pb_migrations pb_migrations

EXPOSE 8090

CMD ["./pocketbase", "serve", "--http=0.0.0.0:8090"]
