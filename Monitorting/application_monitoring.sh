!#bin/bash

#### 
vi train-kube.yml 
"
kind: Service
apiVersion: v1
metadata:
  name: train-schedule-service
  annotations:
    prometheus.io/scrape: 'true'
spec:
  type: NodePort
  selector:
    app: train-schedule
  ports:
  - protocol: TCP
    port: 8080
    nodePort: 8080

---

apiVersion: apps/v1
kind: Deployment
metadata:
  name: train-schedule-deployment
  labels:
    app: train-schedule
spec:
  replicas: 2
  selector:
    matchLabels:
      app: train-schedule
  template:
    metadata:
      labels:
        app: train-schedule
    spec:
      containers:
      - name: train-schedule
        image: linuxacademycontent/train-schedule:1
        ports:
        - containerPort: 8080
"

## depliy
kubectl apply -f train-kube.yml 

kubectl get pods -w 


#### Monitoring request : 
sum(rate(http_request_duration_ms_count[2m])) by (service, route, method, code)




