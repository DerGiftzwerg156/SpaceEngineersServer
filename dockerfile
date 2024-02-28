FROM mono:latest

# Install dependencies
RUN apt-get update && \
    apt-get install -y wget unzip && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Download and install Space Engineers Dedicated Server
RUN mkdir /app && \
    cd /app && \
    wget https://example.com/path/to/SpaceEngineersDedicated.zip && \
    unzip SpaceEngineersDedicated.zip && \
    rm SpaceEngineersDedicated.zip

WORKDIR /app

# Expose ports
EXPOSE 27016/tcp
EXPOSE 27016/udp
EXPOSE 8080

# Start the server
CMD ["mono", "DedicatedServer.exe"]
