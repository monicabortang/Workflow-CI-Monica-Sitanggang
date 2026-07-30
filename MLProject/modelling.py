# ======================================================
# PROYEK AKHIR - MLProject MODELLING
# ======================================================

import pandas as pd
import numpy as np
from sklearn.ensemble import RandomForestClassifier
from sklearn.metrics import accuracy_score
import mlflow
import mlflow.sklearn
import argparse
import pickle

parser = argparse.ArgumentParser()
parser.add_argument('--n_estimators', type=int, default=100)
parser.add_argument('--max_depth', type=int, default=10)
args = parser.parse_args()

print("="*60)
print("🤖 MLProject - Iris Classification")
print("="*60)

# Load data
df = pd.read_csv('dataset_preprocessing.csv')
X = df.iloc[:, :-1].values
y = df['target'].values

print(f"✅ Data loaded: {len(df)} records")

# Train model
model = RandomForestClassifier(
    n_estimators=args.n_estimators,
    max_depth=args.max_depth if args.max_depth > 0 else None,
    random_state=42
)
model.fit(X, y)

# Evaluasi
y_pred = model.predict(X)
acc = accuracy_score(y, y_pred)

print(f"\n✅ Parameters:")
print(f"  n_estimators: {args.n_estimators}")
print(f"  max_depth: {args.max_depth}")
print(f"✅ Akurasi: {acc:.4f}")

# Save to MLflow
with mlflow.start_run():
    mlflow.log_params({
        "n_estimators": args.n_estimators,
        "max_depth": args.max_depth
    })
    mlflow.log_metric("accuracy", acc)
    mlflow.sklearn.log_model(model, "model")

# Save model
with open('model.pkl', 'wb') as f:
    pickle.dump(model, f)

print("\n✅ Model saved: model.pkl")
print("✅ MLflow run selesai!")