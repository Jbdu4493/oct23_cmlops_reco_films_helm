#!/bin/bash

kubectl create namespace argocd 
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml 
kubectl patch svc argocd-server -n argocd -p '{"spec": {"type": "LoadBalancer"}}' 

sleep 60 

kubectl apply -f https://raw.githubusercontent.com/Jbdu4493/oct23_cmlops_reco_films_helm/main/DEV/AIRFLOW/application_argocd.yaml 
kubectl apply -f https://raw.githubusercontent.com/Jbdu4493/oct23_cmlops_reco_films_helm/main/DEV/APPLICATION/application_argocd.yaml
kubectl apply -f https://raw.githubusercontent.com/Jbdu4493/oct23_cmlops_reco_films_helm/main/DEV/MLFLOW/application_argocd.yaml 
argocd admin initial-password -n argocd 