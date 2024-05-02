#!/bin/bash


kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
kubectl patch svc argocd-server -n argocd -p '{"spec": {"type": "LoadBalancer"}}'

echo "Waiting for argocd installation"
sleep 30

kubectl apply -f https://raw.githubusercontent.com/Jbdu4493/oct23_cmlops_reco_films_helm/main/PRD/AIRFLOW/application_argocd.yaml
kubectl apply -f https://raw.githubusercontent.com/Jbdu4493/oct23_cmlops_reco_films_helm/main/PRD/APPLICATION/application_argocd.yaml
kubectl apply -f https://raw.githubusercontent.com/Jbdu4493/oct23_cmlops_reco_films_helm/main/PRD/MLFLOW/application_argocd.yaml
argocd admin initial-password -n argocd