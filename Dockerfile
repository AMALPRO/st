# Use an official FFmpeg image from the Docker Hub
FROM jrottenberg/ffmpeg:4.3-scratch

# Install additional dependencies if needed
RUN apt-get update && \
    apt-get install -y wget && \
    rm -rf /var/lib/apt/lists/*

# Create a working directory
# Copy your FFmpeg script into the container
COPY start.sh /start.sh
RUN chmod +x /start.sh
CMD ["./start.sh"]
