helm repo add crossplane-stable https://charts.crossplane.io/stable
helm repo update
helm install crossplane crossplane-stable/crossplane --namespace crossplane-system --create-namespace
kubectl get pods -n crossplane-system
cd ..
kubectl create secret generic aws-secret -n crossplane-system --from-file=creds=./aws-credentials.txt
cd -
cd Kubernetes/Crossplane/aws/provider 
kubectl apply -f provider.yaml
kubectl apply -f provider-conf.yaml