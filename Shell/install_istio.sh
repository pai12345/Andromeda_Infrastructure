sudo sysctl fs.protected_regular=0
minikube addon enable metrics-server
minikube start --force
curl -L https://istio.io/downloadIstio | sh -
cd istio-1.18.2
export PATH=$PWD/bin:$PATH
istioctl install --set profile=demo -y
kubectl apply -f https://raw.githubusercontent.com/istio/istio/release-1.18/samples/addons/kiali.yaml
kubectl apply -f https://raw.githubusercontent.com/istio/istio/release-1.18/samples/addons/prometheus.yaml

