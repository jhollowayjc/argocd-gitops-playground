# argocd gitops playground

Experimenting local development workflows when doing GitOps and using argo-cd.

## Local development 

**Dependencies:**
- `minikube`
- `kubectl`
- `helm` (optional)

### Start a cluster
```
minikube start
```

### Bootstrap argo-cd install
```
kubectl apply -k ./control-plane
```

### Get initial admin password
```
kubectl get secret/argocd-initial-admin-secret -o jsonpath='{.data.password}' -n argocd | base64 -d; echo
```

### Login to argocd CLI & expose argo-cd UI
```
kubectl port-forward svc/argo-cd-argocd-server -n argocd 8443:443
argocd login 127.0.0.1:8443
open http://127.0.0.1:8443
```

### Have argo-cd install everything else 
```
helm install gitops --set environment=local-dev 
```

### Sync changes from local path
```
argocd app sync <app> --local ./add-ons/env/local-dev/<app>
```


## New environments

To add a new environment, create a directory under `env/` e.g. `env/stg` for the `environment=stg`.

