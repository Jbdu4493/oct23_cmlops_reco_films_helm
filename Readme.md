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

- [Kubernetes cluster](https://kubernetes.io/)
- [Helm 3](https://helm.sh/docs/intro/install/)
- [ArgoCD](https://argo-cd.readthedocs.io/en/stable/)

### ArgoCD Setup

1. Install ArgoCD in your Kubernetes cluster following the [official documentation](https://argo-cd.readthedocs.io/en/stable/getting_started/).
2. Configure access to your Kubernetes cluster for ArgoCD.


### Helm Chart Installation

1. Clone the `oct23_cmlops_reco_films_helm` repository.
2. Navigate to the repository directory.
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
