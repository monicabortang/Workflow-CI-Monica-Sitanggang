FROM python:3.12-slim

WORKDIR /app

# Install build dependencies
RUN apt-get update && apt-get install -y \
    gcc \
    g++ \
    && rm -rf /var/lib/apt/lists/*

# Copy requirements
COPY MLProject/requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy semua file MLProject
COPY MLProject/ .

# Expose port untuk serving
EXPOSE 5000

# Entrypoint untuk serving model
ENTRYPOINT ["mlflow", "models", "serve", "-m", "model", "-h", "0.0.0.0", "-p", "5000"]