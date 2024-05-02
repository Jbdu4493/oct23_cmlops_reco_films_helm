#!/bin/bash

kubectl delete -f https://raw.githubusercontent.com/Jbdu4493/oct23_cmlops_reco_films_helm/main/PRD/AIRFLOW/application_argocd.yaml 
kubectl delete -f https://raw.githubusercontent.com/Jbdu4493/oct23_cmlops_reco_films_helm/main/PRD/APPLICATION/application_argocd.yaml
kubectl delete -f https://raw.githubusercontent.com/Jbdu4493/oct23_cmlops_reco_films_helm/main/PRD/MLFLOW/application_argocd.yaml
kubectl delete -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

kubectl delete all --all -n argocd
kubectl delete all --all -n app-movieflix-prd


kubectl delete statefulset airflow-postgresql -n default
kubectl delete crds --selector app.kubernetes.io/part-of=argocd
kubectl delete clusterrole,clusterrolebinding --selector app.kubernetes.io/part-of=argocd

kubectl delete pvc --all -n app-movieflix-prd
kubectl delete pv --all -n app-movieflix-prd

kubectl delete namespace argocd
kubectl delete namespace app-movieflix-prd