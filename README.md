# 🚀 Cloud-Native Microservices Architecture

A production-ready demonstration of modern cloud-native microservices architecture implementing containerization, orchestration, infrastructure as code, monitoring, auto-scaling, and secure configuration management.

## 📋 Table of Contents

- [Overview](#overview)
- [Architecture](#architecture)
- [Key Features](#key-features)
- [Project Structure](#project-structure)
- [Requirements](#requirements)
- [Getting Started](#getting-started)
  - [Local Development](#local-development)
  - [Kubernetes Deployment](#kubernetes-deployment)
- [Monitoring Setup](#monitoring-setup)
- [Auto-Scaling Configuration](#auto-scaling-configuration)
- [Secret Management](#secret-management)
- [Future Improvements](#future-improvements)
- [Contributing](#contributing)
- [License](#license)

## 🔍 Overview

This project demonstrates a comprehensive cloud-native architecture that leverages microservices design patterns, container orchestration, and DevOps best practices. It's designed to showcase scalable, resilient, and observable systems that can be deployed to any Kubernetes environment.

## 🏗️ Architecture

The application consists of:

- **Microservices**: Independent Flask-based services with single responsibilities
- **API Gateway**: NGINX-powered gateway for request routing and load balancing
- **Infrastructure as Code**: Terraform configurations for reproducible deployments
- **Container Orchestration**: Kubernetes manifests for scalable container management
- **Observability Stack**: Prometheus and Grafana for metrics collection and visualization

## ✨ Key Features

- **Containerized Microservices**: Isolated, independently deployable services
- **Service Discovery**: Kubernetes-native service resolution
- **Centralized Gateway**: Unified entry point with intelligent routing
- **Infrastructure as Code**: Terraform-managed infrastructure resources
- **Declarative Deployments**: Kubernetes manifests for deployment configurations
- **Comprehensive Monitoring**: Prometheus metrics with Grafana dashboards
- **Horizontal Pod Autoscaling**: Dynamic scaling based on resource utilization
- **Secure Configuration**: Kubernetes Secrets for sensitive information

## 📁 Project Structure

```
cloud-native-microservices/
├── services/              # Microservice applications
│   ├── user-service/      # User management service
│   └── product-service/   # Product catalog service
├── gateway/               # NGINX API Gateway configuration
├── infra/                 # Terraform IaC configurations
├── k8s/                   # Kubernetes deployment manifests
├── monitoring/            # Prometheus/Grafana configurations
└── docker-compose.yml     # Local development orchestration
```

## 🔧 Requirements

- Docker & Docker Desktop (with Kubernetes enabled)
- kubectl CLI tool
- Helm package manager
- Terraform
- Python 3.8+

## 🚀 Getting Started

### Local Development

1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/cloud-native-microservices.git
   cd cloud-native-microservices
   ```

2. Build and run services using Docker Compose:
   ```bash
   docker-compose up --build
   ```

3. Access the services:
   - User Service: http://localhost:5000/users
   - Product Service: http://localhost:5001/products

### Kubernetes Deployment

1. Ensure Kubernetes is running (Docker Desktop or Minikube)
2. Apply Kubernetes manifests:
   ```bash
   kubectl apply -f k8s/user-deployment.yaml
   kubectl apply -f k8s/product-deployment.yaml
   kubectl apply -f k8s/gateway-deployment.yaml
   ```

3. Verify deployments and services:
   ```bash
   kubectl get deployments
   kubectl get services
   kubectl get pods
   ```

## 📊 Monitoring Setup

1. Add the Prometheus community Helm repository:
   ```bash
   helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
   helm repo update
   ```

2. Install the Prometheus and Grafana stack:
   ```bash
   helm install monitoring prometheus-community/kube-prometheus-stack
   ```

3. Access Grafana dashboards:
   ```bash
   kubectl port-forward svc/monitoring-grafana 3000:80
   ```

4. Open http://localhost:3000 in your browser
   - Default username: admin
   - Password (retrieve with):
     ```bash
     kubectl get secret monitoring-grafana -o jsonpath="{.data.admin-password}" | base64 --decode
     ```

## 📈 Auto-Scaling Configuration

Configure Horizontal Pod Autoscaler (HPA) for automatic scaling:

```bash
# Enable metrics-server if not already available
kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml

# Configure HPA for the user service
kubectl autoscale deployment user-service --cpu-percent=50 --min=1 --max=3

# Monitor autoscaling behavior
kubectl get hpa
```

## 🔐 Secret Management

Create and manage Kubernetes secrets for sensitive configuration:

```bash
# Create a secret for database credentials
kubectl create secret generic user-service-secret --from-literal=DB_PASSWORD=mysecret123

# Verify the secret was created
kubectl get secrets
```

Secrets are injected as environment variables in the deployment manifests.

## 🧠 Future Improvements

- Cloud provider deployment (AWS EKS, GKE, AKS) with Terraform
- CI/CD pipeline with GitHub Actions or Jenkins
- Enhanced secret management with HashiCorp Vault or cloud provider solutions
- Service mesh implementation with Istio
- Distributed tracing with Jaeger or Zipkin
- Comprehensive logging solution (ELK/EFK stack)
- Unit and integration testing framework
- GitOps workflow with ArgoCD or Flux

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.
