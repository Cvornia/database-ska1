FROM alpine:3.18

# Install dependencies
RUN apk add --no-cache curl unzip

# Download PocketBase binary
RUN curl -L -o /tmp/pb.zip https://github.com/pocketbase/pocketbase/releases/download/v0.21.1/pocketbase_0.21.1_linux_amd64.zip && \
    unzip /tmp/pb.zip -d /pb && \
    chmod +x /pb/pocketbase && \
    rm /tmp/pb.zip

# Expose port
EXPOSE 8090

# Set working directory
WORKDIR /pb

# Run PocketBase
CMD ["./pocketbase", "serve", "--http=0.0.0.0:8090"]
