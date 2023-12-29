#!/bin/bash

# Create Dockerfile
echo "FROM python:3.11" > Dockerfile
echo "WORKDIR /app" >> Dockerfile
echo "COPY . ." >> Dockerfile
echo "RUN pip install -r requirements.txt" >> Dockerfile
echo "EXPOSE 8001" >> Dockerfile
echo 'CMD ["python", "run.py", "0.0.0.0:8001"]' >> Dockerfile

# Build Docker image
sudo docker build -t chatbot-app .

# Run Docker container
docker_id=$(sudo docker run -p 8001:8001 -d chatbot-app)
echo "Container ID: $docker_id"

