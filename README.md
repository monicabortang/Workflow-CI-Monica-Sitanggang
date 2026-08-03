# Workflow CI - MLOps Pipeline

## 📋 Deskripsi Proyek

Repository ini berisi **Workflow CI** untuk otomatisasi pipeline Machine Learning menggunakan **MLflow Project** dan **GitHub Actions**.

Proyek ini adalah bagian dari **Kriteria 3** submission Proyek Akhir - Membangun Sistem Machine Learning.

---

## 📁 Struktur Repository
Workflow-CI-Monica-Sitanggang/
├── .github/
│ └── workflows/
│ └── mlflow-project.yml # GitHub Actions workflow
├── MLProject/
│ ├── modelling.py # Script training model
│ ├── MLProject # MLflow Project configuration
│ ├── conda.yaml # Conda environment dependencies
│ ├── requirements.txt # Python dependencies
│ └── dataset_preprocessing.csv # Dataset hasil preprocessing
├── README.md # Dokumentasi
└── Tautan ke Docker Hub # Link Docker image


---

## 🚀 Cara Menjalankan

### 1. Clone Repository

git clone https://github.com/monicabortang/Workflow-CI-Monica-Sitanggang.git
cd Workflow-CI-Monica-Sitanggang

### 2. Jalankan MLflow Project Secara Lokal
cd MLProject
mlflow run .

### 3. Jalankan dengan Parameter Kustom
mlflow run . -P n_estimators=200 -P max_depth=20


## 🔧 GitHub Actions Workflow
Workflow akan berjalan secara otomatis ketika:

✅ Push ke branch main

✅ Pull Request ke branch main

✅ Dijalankan manual melalui workflow_dispatch

### Workflow Steps:
Checkout code → Mengambil kode dari repository

Setup Python → Menginstal Python 3.12

Install dependencies → Menginstal library yang dibutuhkan

Run MLflow Project → Menjalankan training model

Upload artifacts → Menyimpan hasil training (model, metrics, artifacts)

## 📊 Hasil Workflow
Setelah workflow berhasil dijalankan, artifacts akan tersimpan di GitHub Actions:

Artifact	Deskripsi
mlflow-artifacts	Model, metrics, dan artifacts dari MLflow

## 🐳 Docker Image (Advanced)
Repository ini juga mendukung deployment melalui Docker:
# Build Docker image
docker build -t monicabortang/mlflow-model:latest .

# Push ke Docker Hub
docker push monicabortang/mlflow-model:latest

Docker Hub Link: https://hub.docker.com/r/monicabortang/mlflow-model