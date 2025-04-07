#!/bin/bash

# Set up colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}Starting GitDiagram deployment...${NC}"

# Check if docker is installed
if ! command -v docker &> /dev/null; then
    echo "Docker is not installed. Please install Docker and Docker Compose first."
    exit 1
fi

# Check if docker-compose is installed
if ! command -v docker-compose &> /dev/null; then
    echo "Docker Compose is not installed. Please install Docker Compose first."
    exit 1
fi

# Check if .env file exists
if [ ! -f .env ]; then
    echo "Creating .env file from .env.example..."
    cp .env.example .env
    echo "Please edit the .env file with your credentials and run this script again."
    exit 1
fi

# Create directory for init scripts if it doesn't exist
mkdir -p docker-entrypoint-initdb.d

# Build and start the containers
echo -e "${GREEN}Building and starting containers...${NC}"
docker-compose up -d --build

echo -e "${GREEN}GitDiagram is now running!${NC}"
echo -e "Frontend: http://localhost:3000"
echo -e "Backend: http://localhost:8000"
echo -e "Database: postgresql://postgres:postgres@localhost:5432/gitdiagram"
echo -e "\nTo stop the services, run: docker-compose down"
echo -e "To view logs, run: docker-compose logs -f" 