# Movieflix: Film Recommendation System Deployment on Local Kubernetes cluster

## Introduction

This **MLOps** project combines the power of **Helm** and **ArgoCD** to deploy a film recommendation system into a **Local Kubernetes environment**. It is a part of the [movie-recommander](https://github.com/Chadiboulos/movie-recommander/tree/main) project created during the [Datascientest](https://datascientest.com) training courses to obtain the diploma of **Machine Learning Engineer**. Leveraging Helm charts offers a streamlined and scalable approach to deploy and manage the film recommendation services.

![Recofilm_architecture](https://github.com/Jbdu4493/oct23_cmlops_reco_films_helm/assets/88548265/7aa3d3db-ef1e-4786-a2bf-da8dd091731f)


## Table of Contents

- [Introduction](#introduction)
- [Installation](#installation)
  - [Prerequisites](#prerequisites)
  - [Helm Chart Installation](#helm-chart-installation)
  - [ArgoCD Deployment](#argocd-deployment)
  - [Delete ArgoCD Deployment](#delete-argocd-deployment)
- [Usage](#usage)
- [Dependencies](#dependencies)

## Installation

### Prerequisites

- Local Kubernetes cluster: [Docker Desktop](https://www.docker.com/products/docker-desktop/) + [Turn on Kubernetes](https://docs.docker.com/desktop/kubernetes/)
- [Helm 3](https://helm.sh/docs/intro/install/)
```sh
# Install Helm
$ curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
$ chmod 700 get_helm.sh
$ ./get_helm.sh
```
- [ArgoCD](https://argo-cd.readthedocs.io/en/stable/getting_started/)

```sh
# Install Argo CD
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

# Install Argo CD CLI
curl -sSL -o argocd-linux-amd64 https://github.com/argoproj/argo-cd/releases/latest/download/argocd-linux-amd64
sudo install -m 555 argocd-linux-amd64 /usr/local/bin/argocd
rm argocd-linux-amd64

# Access Argo CD API Server
kubectl patch svc argocd-server -n argocd -p '{"spec": {"type": "LoadBalancer"}}'
kubectl port-forward svc/argocd-server -n argocd 8081:443
```

### Helm Chart Installation

1. Clone the current `oct23_cmlops_reco_films_helm` repository.
2. Navigate to the repository local directory on your computer.
3. Deploy the movie recommender Helm chart to your Kubernetes cluster using:
```sh
helm install my-film-reco-films-DEV ./DEV/
```

### ArgoCD Deployment
With ArgoCD deploy Application, Airflow and MLflow Helm releases.
```sh
./install_app.sh
```
Use "admin" and auto-generated password to access to ArgoCD API Server

### Delete ArgoCD Deployment
Delete ArgoCD deployments of Application, Airflow and MLflow Helm releases.
```sh
./uninstall_app.sh
```

Usage
=====

After successful deployment, the film recommendation system will be accessible by FastAPI, Streamlit and other services hosted on Local Kubernetes cluster:

ArgoCD API Server - 
localhost:8081 (admin - auto-generated password)

FastApi Application -
localhost:8001/docs (test1 - testuser)

Airflow -
localhost:8080 (admin - admin)

MLflow - 
localhost:5001

Streamlit -
localhost:8504 (test1 - testuser)

Dependencies
============

*   Docker
*   Kubernetes
*   Helm
*   ArgoCD

