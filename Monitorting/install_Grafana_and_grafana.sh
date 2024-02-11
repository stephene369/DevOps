#!bin/bash

################## INSTALL HELM

## download and execute shell
curl https://raw.githubusercontent.com/kubernetes/helm/master/scripts/get > /tmp/get_helm.sh
chmod 700 /tmp/get_helm.sh
DESIRED_VERSION=v2.8.2 /tmp/get_helm.sh

## init helm 
helm init --wait 

## config helm , setting up some permission 
kubectl --namespace=kube-system create clusterrolebinding add-on-cluster-admin --clusterrole=cluster-admin --
helm ls


################ CLONE KUBERNATES CHAT Repository
### Clone 
cd ~/
git clone https://github.com/kubernetes/charts
cd charts

## 
git checkout efdcffe0b6973111ec6e5e83136ea74cdbe6527d
cd ../
vi prometheus-values.yml
"
alertmanager:
  persistentVolume:
    enabled: false
server:
  persistentVolume:
    enabled: false
"


################## INSTALL PROMETHEUS #################
helm install -f prometheus-values.yml charts/stable/prometheus --name prometheus --namespace prometheus
vi grafana-values.yml



################## GRAFANA INSTALLATION 
## create grafana-values
vi grafana-values.yml 
"
adminPassword: password
"
### install 
helm install -f grafana-values.yml charts/stable/grafana/ --name grafana --namespace grafana
vi grafana-ext.yml



##################### Expose note to try to login grafana 
## create grafana-ext file 
vi grafana-ext.yml
"
kind: Service
apiVersion: v1
metadata:
  namespace: grafana
  name: grafana-ext
spec:
  type: NodePort
  selector:
    app: grafana
ports:
- protocol: TCP
  port: 3000
  nodePort: 8080
"

#### apply grafana ext withkubernates
kubectl apply -f grafana-ext.yml


#### checkout the status of grafana and prometeus 
kubectl get pods -n prometheus
kubectl get pods -n grafana






