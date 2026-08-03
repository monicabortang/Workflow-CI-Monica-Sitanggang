FROM python:3.12

WORKDIR /app

# Copy requirements first
COPY MLProject/requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy semua file
COPY MLProject/ .

EXPOSE 5000

ENTRYPOINT ["mlflow", "models", "serve", "-m", "model", "-h", "0.0.0.0", "-p", "5000"]