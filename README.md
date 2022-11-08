# argocd gitops playground

Experimenting local development workflows when doing GitOps and using argo-cd.

## Local development 

**Dependencies:**
- `helm`
- `minikube`
- `kubectl`

### Start a cluster
```
minikube start
```

### Bootstrap argo-cd install
```
helm install argo-cd add-ons/env/local-dev/argo-cd --create-namespace --dependency-update --namespace=argocd
```

### Get initial admin password
```
kubectl get secret/argocd-initial-admin-secret -o jsonpath='{.data.password}' | base64 -d; echo
```

### Login to argocd CLI & expose argo-cd UI
```
kubectl port-forward svc/argo-cd-argocd-server 8443:443
argocd login 127.0.0.1:8443
open http://127.0.0.1:8443
```

### Have argo-cd install everything else 
```
helm install local-dev chart/env/local-dev
```

### Sync changes from local path
```
argocd app sync <app> --local ./chart/env/local-dev
```
