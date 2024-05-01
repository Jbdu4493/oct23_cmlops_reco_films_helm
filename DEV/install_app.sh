
#!/bin/bash

kubectl apply -f https://raw.githubusercontent.com/Jbdu4493/oct23_cmlops_reco_films_helm/main/DEV/AIRFLOW/application_argocd.yaml 
kubectl apply -f https://raw.githubusercontent.com/Jbdu4493/oct23_cmlops_reco_films_helm/main/DEV/APPLICATION/application_argocd.yaml
kubectl apply -f https://raw.githubusercontent.com/Jbdu4493/oct23_cmlops_reco_films_helm/main/DEV/MLFLOW/application_argocd.yaml 
argocd admin initial-password -n argocd