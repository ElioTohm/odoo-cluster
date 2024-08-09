#!/bin/bash
. $(pwd)/init.sh

print_headline "installing Istio"

print_header "Updating Helm Repos"
helm repo add istio https://istio-release.storage.googleapis.com/charts
helm repo update

print_header "installing istio base/istiod and gateway in istio-system"
kubectl create namespace istio-system
helm install base istio/base -n istio-system --wait
helm install istiod istio/istiod -n istio-system --wait
helm install ingressgateway istio/gateway -n istio-system --wait

print_header "setting up gateway"
kubectl apply -f istio-gateways.yaml
