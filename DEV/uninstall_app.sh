#!/bin/bash

kubectl delete -f https://raw.githubusercontent.com/Jbdu4493/oct23_cmlops_reco_films_helm/main/DEV/AIRFLOW/application_argocd.yaml 
kubectl delete -f https://raw.githubusercontent.com/Jbdu4493/oct23_cmlops_reco_films_helm/main/DEV/APPLICATION/application_argocd.yaml
kubectl delete -f https://raw.githubusercontent.com/Jbdu4493/oct23_cmlops_reco_films_helm/main/DEV/MLFLOW/application_argocd.yaml
kubectl delete -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

kubectl delete all --all -n argocd
kubectl delete all --all -n app-movieflix-dev


kubectl delete statefulset airflow-postgresql -n default
kubectl delete crds --selector app.kubernetes.io/part-of=argocd
kubectl delete clusterrole,clusterrolebinding --selector app.kubernetes.io/part-of=argocd

kubectl delete pvc --all -n app-movieflix-dev
kubectl delete pv --all -n app-movieflix-dev

kubectl delete namespace argocd
kubectl delete namespace app-movieflix-dev