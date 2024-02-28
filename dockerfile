FROM mono:latest

# Install dependencies
RUN apt-get update && \
    apt-get install -y wget unzip && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Copy Space Engineers Dedicated Server files
COPY SpaceEngineersDedicated.zip /app/SpaceEngineersDedicated.zip

# Unzip Space Engineers Dedicated Server files
RUN cd /app && \
    unzip SpaceEngineersDedicated.zip && \
    rm SpaceEngineersDedicated.zip

WORKDIR /app

# Expose ports
EXPOSE 27016/tcp
EXPOSE 27016/udp
EXPOSE 8080

# Start the server
CMD ["mono", "DedicatedServer.exe"]
