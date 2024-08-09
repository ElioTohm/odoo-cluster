#!/bin/bash
. $(pwd)/init.sh

print_headline "Start k3d odoo cluster"
k3d cluster create odoo-cluster -p '80:80@loadbalancer' -p '443:443@loadbalancer' --agents 3 --k3s-arg '--disable=traefik@server:*'

./install-istio.sh

./install-odoo.sh
