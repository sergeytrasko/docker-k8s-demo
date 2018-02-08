# Docker app with Kubernetes (Minikube)

## Prerequisites

- minikube
- kubectl

Start `minikube`:

```
minikube start
```

Reuse Minikube's docker daemon (to be able to use locally build docker images):

```
eval $(minikube docker-env)
```

## Build image

```
docker build -t docker-k8s-demo:latest .
```

## Run in Kubernetes cluster

```
kubectl apply -f k8s/deployment.yaml 
```

It will:

- start an application (pod) in Docker container
- scale it to 2 nodes
- create a service to provide single endpoint for pods
- create ingress to route requests to service

## Check if it works

```
curl -Lk $(minikube ip)
```

You should get back

```
Hello, world!
```