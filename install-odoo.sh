#!/bin/bash
. $(pwd)/init.sh

print_headline "installing odoo"
helm upgrade --install odoo oci://registry-1.docker.io/bitnamicharts/odoo -f odoo.values.yaml

kubectl apply -f odoo-vs.yaml
