# bootstrap

Sets up a kubernetes cluster to act as a gitops control-plane using argo-cd. 

## bootstrapping a new cluster
```
kubectl apply -k ./overlays/<env>
```
