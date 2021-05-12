#!/bin/sh

VM='myVm'
RG='myRGVM'
LOCATION='eastus'
IMAGE='Win2019Datacenter'
SIZE='Standard_D2s_v3'
USER='azureuser'
PASS='Pa$$w0rd1234'

az login
az account set -s f7052807-d1f7-47b0-8968-4ae1f397400e
az group create -l $LOCATION -n $RG
az vm create -n $VM -g $RG --admin-username "$USER" --admin-password "$PASS"  --image $IMAGE -l $LOCATION  --nsg-rule RDP,HTTP --size $SIZE --no-wait
az vm boot-diagnostics disable --ids $(az vm list -n $VM -g $RG --query "[].id" -o tsv)


# az group delete -n $RG --no-wait -y
# az group list -o table