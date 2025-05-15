FROM alpine:3.18

# Install curl dan unzip
RUN apk add --no-cache curl unzip

# Set working directory
WORKDIR /pb

# Download dan ekstrak PocketBase
RUN curl -L https://github.com/pocketbase/pocketbase/releases/download/v0.21.1/pocketbase_0.21.1_linux_amd64.zip -o pb.zip \
    && unzip pb.zip \
    && rm pb.zip \
    && chmod +x pocketbase

# Expose port
EXPOSE 8090

# Jalankan PocketBase
CMD ["./pocketbase", "serve", "--http=0.0.0.0:8090"]
