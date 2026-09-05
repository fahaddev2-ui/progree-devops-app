# 🚀 Progree DevOps Internship Project
**Built by:** Fahad Ali  
**GitHub:** fahaddev2-ui  
**Internship:** Progree — DevOps Track

---

## 📋 Project Overview
A fully containerized Node.js web application with automated CI/CD pipeline and cloud-ready Kubernetes infrastructure — built from scratch during the Progree DevOps Internship.

---

## ✅ Tasks Completed

### Task 1 — LinkedIn Announcement
Posted official internship acceptance on LinkedIn with learning goals, tagged Progree, and used required hashtags.

### Task 2 — Application Containerization
- Built a Node.js + Express web server with two endpoints (`/` and `/health`)
- Authored a **multi-stage Dockerfile** using `node:18-alpine`
- Stage 1 (Builder): installs dependencies
- Stage 2 (Production): ships only runtime files — reduces image size by ~80%
- Configured environment variables (`NODE_ENV`, `PORT`) and port routing
- Added Docker health check monitoring

### Task 3 — CI/CD Pipeline
- Configured **GitHub Actions** workflow (`.github/workflows/ci-cd.yml`)
- Pipeline triggers automatically on every push to `main`
- 3 sequential jobs:
  1. **Lint & Test** — installs dependencies, runs tests
  2. **Build Docker Image** — builds and tags image with commit SHA
  3. **Deployment Status Board** — logs deployment metrics

### Task 4 — Infrastructure as Code + Kubernetes
- **Terraform** (`terraform/main.tf`): provisions network config and app config as code
- **Kubernetes manifests** (`k8s/`):
  - `deployment.yaml` — runs 2 replicas of the containerized app
  - `service.yaml` — routes external traffic to pods via NodePort
  - `pvc.yaml` — persistent volume claim (1Gi storage)
  - `hpa.yaml` — auto-scales pods from 2→5 when CPU hits 70%
  - `ingress.yaml` — reverse proxy with domain routing

---

## 🗂️ Project Structure
progree-devops-app/
├── .github/
│ └── workflows/
│ └── ci-cd.yml # GitHub Actions CI/CD pipeline
├── k8s/
│ ├── deployment.yaml # Kubernetes deployment
│ ├── service.yaml # NodePort service
│ ├── pvc.yaml # Persistent volume claim
│ ├── hpa.yaml # Horizontal pod autoscaler
│ └── ingress.yaml # Ingress controller
├── terraform/
│ └── main.tf # Infrastructure as Code
├── server.js # Node.js Express app
├── package.json # App dependencies
├── Dockerfile # Multi-stage Docker build
└── .dockerignore # Docker ignore rules

## 🛠️ Tech Stack
| Tool | Purpose |
|------|---------|
| Node.js + Express | Web application runtime |
| Docker | Containerization |
| GitHub Actions | CI/CD automation |
| Terraform | Infrastructure as Code |
| Kubernetes | Container orchestration |

---

## 🧠 Key Learnings
- Multi-stage Docker builds reduce image size by excluding dev dependencies
- CI/CD pipelines eliminate manual deployment — every push triggers automated testing
- Kubernetes HPA ensures the app scales automatically under load
- Infrastructure as Code makes environments reproducible and version-controlled