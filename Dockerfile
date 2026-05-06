FROM debian:12-slim

ENV DEBIAN_FRONTEND=noninteractive \
    TZ=Etc/UTC

# Base OS + tools
RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates \
    tzdata \
    bash \
    coreutils \
    findutils \
    procps \
    curl \
    wget \
    jq \
    python3 \
    python3-venv \
    python3-pip \
    # fileops tools
    rmlint \
    hashdeep \
    ffmpeg \
    && rm -rf /var/lib/apt/lists/*

# Default workdir for scripts/config
WORKDIR /opt/fileops

# Placeholders for your scripts (cleanup, integrity, similarity helpers)
# You can later ADD or COPY real scripts here if you want them baked in.
RUN mkdir -p /opt/fileops/scripts

# Default entrypoint: just a shell; services will override via `command:`
ENTRYPOINT ["/bin/bash"]
