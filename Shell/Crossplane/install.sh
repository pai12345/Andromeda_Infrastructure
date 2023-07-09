kubectl create namespace crossplane-system
helm repo add upbound-stable https://charts.upbound.io/stable && helm repo update
helm install uxp --namespace crossplane-system upbound-stable/universal-crossplane --devel
kubectl get pods -n crossplane-system
cd ../../..
kubectl create secret generic aws-secret -n crossplane-system --from-file=creds=./aws-credentials.txt
cd -
cd ../../Kubernetes/Global/Namespace
pwd
kubectl apply -f .
cd -
cd ../../Kubernetes/Crossplane/aws/provider
kubectl apply -f .
