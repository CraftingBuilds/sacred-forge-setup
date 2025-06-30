# Use official Ubuntu LTS as a base image
FROM ubuntu:22.04

# Avoid tzdata interactive prompts
ENV DEBIAN_FRONTEND=noninteractive

# Install essential tools
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    curl \
    git \
    unzip \
    nano \
    && rm -rf /var/lib/apt/lists/*

# Install Node.js (LTS)
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - && \
    apt-get install -y nodejs

# Install oci-cli
RUN pip3 install oci-cli

# Create app directory
WORKDIR /app

# Copy project files
COPY . /app

# Install Python dependencies if requirements.txt exists
RUN if [ -f requirements.txt ]; then pip3 install -r requirements.txt; fi

# Install Node dependencies if package.json exists
RUN if [ -f package.json ]; then npm install; fi

# Set environment variables (optional)
ENV PATH="/root/.local/bin:$PATH"

# Default command: bash shell
CMD ["/bin/bash"]
