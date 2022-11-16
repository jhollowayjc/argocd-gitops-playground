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
kubectl apply -k ./control-plane/overlays/<env>
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

### Sync changes from local path
```
argocd app sync <app> --local ./add-ons/env/local-dev/<app>
```
