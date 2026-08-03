FROM python:3.12

WORKDIR /app

# Install build dependencies
RUN apt-get update && apt-get install -y \
    gcc \
    g++ \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Upgrade pip, setuptools, wheel
RUN pip install --upgrade pip setuptools wheel

# Install setuptools first (required for pandas)
RUN pip install setuptools

# Copy requirements
COPY MLProject/requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy semua file MLProject
COPY MLProject/ .

# Expose port
EXPOSE 5000

ENTRYPOINT ["mlflow", "models", "serve", "-m", "model", "-h", "0.0.0.0", "-p", "5000"]