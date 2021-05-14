#!/bin/sh

CONTAINER='mycontainer'
RG='myRGContainer'
LOCATION='eastus'
IMAGE='microsoft/aci-helloworld'
SIZE='Standard_D2s_v3'
USER='azureuser'
PASS='Pa$$w0rd1234'
DNS='mycontainerdnses'

az login
az account set -s f7052807-d1f7-47b0-8968-4ae1f397400e
az group create -l $LOCATION -n $RG --no-wait
az container create -g $RG --name $CONTAINER --image $IMAGE --os-type Linux --ports 80 443 --dns-name-label $DNS --no-wait

az container list --query "[].ipAddress.fqdn"

# az group delete -n $RG --no-wait -y
# az group list -o table