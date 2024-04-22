#!/bin/bash

kubectl delete -f https://raw.githubusercontent.com/Jbdu4493/oct23_cmlops_reco_films_helm/main/DEV/AIRFLOW/application_argocd.yaml 
kubectl delete -f https://raw.githubusercontent.com/Jbdu4493/oct23_cmlops_reco_films_helm/main/DEV/APPLICATION/application_argocd.yaml
kubectl delete -f https://raw.githubusercontent.com/Jbdu4493/oct23_cmlops_reco_films_helm/main/DEV/MLFLOW/application_argocd.yaml
kubectl delete -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

kubectl delete namespace argocd
kubectl delete namespace app-movieflix-dev

kubectl delete statefulset airflow-postgresql
