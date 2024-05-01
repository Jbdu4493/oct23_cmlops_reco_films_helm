# Movieflix: Film Recommendation System Deployment with ArgoCD

## Introduction

This project combines the power of Helm and ArgoCD to deploy a film recommendation system, developed as part of the `oct23_cmlops_reco_films` project, into a Kubernetes environment. Leveraging Helm charts from `oct23_cmlops_reco_films_helm`, it offers a streamlined and scalable approach to deploying and managing the film recommendation service.

## Table of Contents

- [Introduction](#introduction)
- [Installation](#installation)
  - [Prerequisites](#prerequisites)
  - [ArgoCD Setup](#argocd-setup)
  - [Helm Chart Installation](#helm-chart-installation)
- [Usage](#usage)
- [Features](#features)
- [Dependencies](#dependencies)

## Installation

### Prerequisites

- Local Kubernetes cluster: [Docker Desktop](https://www.docker.com/products/docker-desktop/) + [Turn on Kubernetes](https://docs.docker.com/desktop/kubernetes/)
- [Helm 3](https://helm.sh/docs/intro/install/)
```sh
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
kubectl port-forward svc/argocd-server -n argocd 8080:443
```

### Helm Chart Installation

1. Clone the `oct23_cmlops_reco_films_helm` repository.
2. Navigate to the repository directory.
../oct23_cmlops_reco_films_helm/DEV

3. Deploy the Helm chart to your Kubernetes cluster using:
   ```sh
   helm install my-film-reco-films-DEV ./DEV/ 
   helm install my-film-reco-films-PRD ./PRD/ 
   ```

4. Deploy with ArgoCD to manage the deployed Helm release auto.
   ```sh
   kubectl apply -f https://raw.githubusercontent.com/Jbdu4493/oct23_cmlops_reco_films_helm/main/PRD/application_argocd.yaml
   kubectl apply -f https://raw.githubusercontent.com/Jbdu4493/oct23_cmlops_reco_films_helm/main/DEV/application_argocd.yaml
   ```

Usage
=====

After successful deployment, the film recommendation system will be accessible within your Kubernetes cluster. You will have access to API and Streamlit via ingress


Dependencies
============

*   Kubernetes
*   Helm 3
*   ArgoCD
*   Docker
