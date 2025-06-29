# Base Image
FROM ubuntu:22.04

# Install Dependencies
RUN apt update && apt install -y python3 python3-pip git

# Copy project files
COPY . /app
WORKDIR /app

# Install Python dependencies
RUN pip3 install -r requirements.txt

# Default command (update if needed)
CMD ["bash"]
