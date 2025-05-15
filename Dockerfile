# Versi: fix-cache-bypass
FROM alpine:3.18

RUN apk add --no-cache curl unzip

WORKDIR /pb

RUN curl -L https://github.com/pocketbase/pocketbase/releases/download/v0.21.1/pocketbase_0.21.1_linux_amd64.zip -o pb.zip \
    && unzip pb.zip \
    && mv pocketbase /pb/pocketbase \
    && rm pb.zip \
    && chmod +x /pb/pocketbase

EXPOSE 8090

CMD ["/pb/pocketbase", "serve", "--http=0.0.0.0:8090"]
